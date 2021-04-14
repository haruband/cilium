#include "lib/utils.h"

DEFINE_IPV6(LXC_IP, 0x20, 0x1, 0xdb, 0x8, 0xb, 0xad, 0xca, 0xfe, 0x60, 0xd, 0xbe, 0xe2, 0xb, 0xad, 0xca, 0xfe);
#define LXC_IP_V
DEFINE_U32(LXC_IPV4, 0x030200c0);	/* 50462912 */
#define LXC_IPV4 fetch_u32(LXC_IPV4)
DEFINE_U32(LXC_ID, 0x0000ffff);	/* 65535 */
#define LXC_ID fetch_u32(LXC_ID)
DEFINE_U32(HOST_EP_ID, 0x0000090e);	/* 2318 */
#define HOST_EP_ID fetch_u32(HOST_EP_ID)
DEFINE_MAC(NODE_MAC, 0x2, 0x0, 0x60, 0xd, 0xf0, 0xd);
#define NODE_MAC fetch_mac(NODE_MAC)
DEFINE_U32(SECLABEL, 0x00000002);	/* 2 */
#define SECLABEL fetch_u32(SECLABEL)
DEFINE_U32(SECLABEL_NB, 0x02000000);	/* 33554432 */
#define SECLABEL_NB fetch_u32(SECLABEL_NB)
DEFINE_U32(POLICY_VERDICT_LOG_FILTER, 0x0000ffff);	/* 65535 */
#define POLICY_VERDICT_LOG_FILTER fetch_u32(POLICY_VERDICT_LOG_FILTER)
#define POLICY_MAP cilium_policy_65535
#define CALLS_MAP cilium_calls_65535
#define FORCE_LOCAL_POLICY_EVAL_AT_SOURCE 1
#define ENABLE_ROUTING 1
#define CT_MAP_TCP4 cilium_ct4_global
#define CT_MAP_ANY4 cilium_ct_any4_global
#define CT_MAP_TCP6 cilium_ct6_global
#define CT_MAP_ANY6 cilium_ct_any6_global
#define CT_MAP_SIZE_TCP 524288
#define CT_MAP_SIZE_ANY 262144
#define LOCAL_DELIVERY_METRICS 1
#define CONNTRACK 1
#define CONNTRACK_ACCOUNTING 1
#undef CONNTRACK_LOCAL
#undef DEBUG
#undef LB_DEBUG
#undef POLICY_DEBUG
#define DROP_NOTIFY 1
#undef MONITOR_AGGREGATION
#undef ENABLE_NAT46
#undef POLICY_AUDIT_MODE
#define POLICY_VERDICT_NOTIFY 1
#define TRACE_NOTIFY 1
