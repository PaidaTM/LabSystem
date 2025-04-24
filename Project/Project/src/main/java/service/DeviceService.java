package service;

import model.TDevice;

import java.util.List;

/**
 *  TDevice business  management interface written by paidamoyo takudzwa mazambani
 * @author ptm
 */
public interface DeviceService {

        /**
         * Add a new device
         * @param device, Object of TDevice
         * @return Return device object
         */

        public int addDevice(TDevice device);

        /**
         * Modify device information
         * @param device,Object of TDevice
         * @return Return true for success and false for failure
         */
        public boolean updateDevice(TDevice device);

        /**
         * Delete device object
         * @param dvcId  Device Id to delete
         * @return Return true for success and false for failure
         */
        public boolean deleteDevice(int dvcId);

        /**
         * Query  device  according to the dvcId
         * @param dvcId Query the devices according to the dvcId
         * @return The TDevice object is returned successfully,
         * and null is returned if it fails
         */
        public TDevice getDeviceById(int dvcId);


        /**
         * Return all devices under the Equipment bound by the corresponding eqId
         * @param eqId Equipment number of a hotel
         * @return List<TDevice>
         */
        public List<TDevice> getDeviceListByEquipmentId(int eqId);

        /**
         * Returns a list of objects for all device information
         * @return List<TDevice>
         */
        public List<TDevice> getDeviceListByCondition(String devicename);


}
