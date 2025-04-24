package service;

import model.TEquipment;

import java.util.List;
/**
 * Equipment business management  interface written by paidamoyo takudzwa mazambani
 * @author ptm
 */
public interface EquipmentService {

        /**
         * add new equipment in t_equipment,
         * @param equipment, Object of TEquipment entity class
         * @return boolean,return hotel id when success, otherwise return 0
         *
         */
        public int addEquipment(TEquipment equipment);

        /**
         * modify equipment information
         * @param equipment Object of TEquipment entity class
         * @return boolean, return true when success, otherwise false
         */
        public boolean updateEquipment(TEquipment equipment);

        /**
         * remove the equipment based on eqid
         * @param eqid
         * @return boolean, return true when success, otherwise false
         */
        public boolean removeEquipment(int eqid);

        /**
         * Return the matching equipment object according to the eqid
         * @param eqid
         * @return TEquipment, return null when find fail
         */
        public TEquipment getEquipmentByid(int eqid);

        public List<TEquipment> getParentEquipment(int eqid);
        /**
         * Returns a list of objects for all equipment information
         * @return List<TEquipment>
         */
        public List<TEquipment> getEquipmentListByCondition(String equipmentname);

        /**
         * 获Get all equipment managed by the specified user
         * @param userid
         * @return List<TEquipment>
         */
        public List<TEquipment> getEquipmentByCreator(int userid);

        /**
         * Get all list of equipment broken by the user
         * @param person user responsible
         * @return List of damaged equipment
         */
        public List<TEquipment> getEquipmentDamagedByPricipalID( int person);

}
