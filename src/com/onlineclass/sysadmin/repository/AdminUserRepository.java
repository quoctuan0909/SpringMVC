package com.onlineclass.sysadmin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.onlineclass.sysadmin.entity.AdminUser;

@Repository
public interface AdminUserRepository extends CrudRepository<AdminUser, Integer> {

//	@Query(value = "SELECT c FROM Customer c WHERE c.name LIKE '%' || :keyword || '%'"
//			+ " OR c.email LIKE '%' || :keyword || '%'"
//			+ " OR c.address LIKE '%' || :keyword || '%'")
//	public List<AdminUser> search(@Param("keyword") String keyword);

	@Query(value = "SELECT * FROM adminuser ORDER BY :colnmSort DESC LIMIT :limit OFFSET :skip", nativeQuery = true)
	public List<AdminUser> getListUserInRange(@Param("limit") int limit, @Param("skip") int skip,
			@Param("colnmSort") String colnmSort);

	@Query(value = "SELECT * FROM adminuser ORDER BY ID DESC LIMIT :limit OFFSET :skip", nativeQuery = true)
	public List<AdminUser> getListUserInRange_2(@Param("limit") int limit, @Param("skip") int skip);

	// Sort ASC

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY ID ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByIDASC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY Name ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByNameASC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY Email ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByEmailASC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT a.ID,a.Name,a.Email,a.Password,a.AgentID,a.StatusCD,a.Notes,a.CreatedAt,a.UpdatedAt,a.DeletedAt FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) a INNER JOIN commoncode c ON a.StatusCD = c.Value ORDER BY c.Name ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByStatusASC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY Notes ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByNotesASC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY CreatedAt ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByCreatedAtASC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY UpdatedAt ASC;", nativeQuery = true)
	public List<AdminUser> getListUserByUpdatedAtASC(@Param("limit") int limit, @Param("skip") int skip);

	// DESC ASC

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY ID DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByIDDESC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY Name DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByNameDESC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY Email DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByEmailDESC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT a.ID,a.Name,a.Email,a.Password,a.AgentID,a.StatusCD,a.Notes,a.CreatedAt,a.UpdatedAt,a.DeletedAt FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) a INNER JOIN commoncode c ON a.StatusCD = c.Value ORDER BY c.Name DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByStatusDESC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY Notes DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByNotesDESC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY CreatedAt DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByCreatedAtDESC(@Param("limit") int limit, @Param("skip") int skip);

	@Query(value = "SELECT * FROM ( SELECT * FROM adminuser WHERE DeletedAt IS NULL ORDER BY ID ASC LIMIT :limit OFFSET :skip ) as a ORDER BY UpdatedAt DESC;", nativeQuery = true)
	public List<AdminUser> getListUserByUpdatedAtDESC(@Param("limit") int limit, @Param("skip") int skip);

	// Update Data
	@Modifying
	@Transactional
	@Query(value = "UPDATE adminuser SET Name = :newName, Password = :password,AgentID = :agentID,StatusCD = :statusCD, Notes = :notes,UpdatedAt = :updatedAt  WHERE ID = :userID", nativeQuery = true)
	public void updateUserName(@Param("userID") int userID, @Param("newName") String newName,
			@Param("password") String password, @Param("agentID") String agentID, @Param("statusCD") int statusCD,
			@Param("notes") String notes, @Param("updatedAt") String updatedAt);

	// Delete Data
	@Modifying
	@Transactional
	@Query(value = "UPDATE adminuser SET DeletedAt = :deletedAt WHERE ID = :userID", nativeQuery = true)
	public void deleteUser(@Param("userID") int userID, @Param("deletedAt") String deletedAt);

	@Query(value = "SELECT COUNT(*) FROM adminuser WHERE DeletedAt IS NULL", nativeQuery = true)
	public int totalUserNotDeleteInDB();

	@Query(value = "SELECT * FROM adminuser a WHERE a.Email = :email", nativeQuery = true)
	public AdminUser getUserByEmail(@Param("email") String email);
}
