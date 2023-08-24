Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBEA78771D
	for <lists+samba-technical@lfdr.de>; Thu, 24 Aug 2023 19:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=x6Zlld6Z98y/yYhTszw6PqifU72Ymt/0H70ubRt2QPg=; b=QV9fMj+Slxqebl7xjEuCdqxZeR
	0Eu21bhasLh0hp4IGCy6FFk4fTP1PZlKvvwgXwrhNkIjJ69ldX8ZsYO1jeE5znYSIBhb5dLWQwRoT
	Bu7YhRKt5sVeMDYqeMSQ8FiJpxkRrAkV/NFQDOVxZYdglrDrSIPKLKdqQgLStiGhxK40bMjID0+lQ
	U7RawjCqN14S9De0VTQF2P3esRJwpF8jF/4AWjs8GX+eINQ/HsIvO6BvS3X6oFKs8DRlerl297NnK
	OxmdpVS0NJjHwGOhm6IylmVIqOtZmIql7nCKafQk67icEOvkpsZNeLkPGXFyy57eQ3bB//QNQ2Nhp
	AC4Enr/w==;
Received: from ip6-localhost ([::1]:19158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZEDa-00EN9Q-Lj; Thu, 24 Aug 2023 17:34:02 +0000
Received: from us-smtp-delivery-147.mimecast.com ([170.10.133.147]:37033) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qZEDU-00EN9H-0b
 for samba-technical@lists.samba.org; Thu, 24 Aug 2023 17:34:00 +0000
Received: from isotope.sldomain.com (192.30.190.20 [192.30.190.20]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 us-mta-298-Cyg5BmSnNsOvFrJkdYmktA-1; Thu, 24 Aug 2023 13:33:50 -0400
X-MC-Unique: Cyg5BmSnNsOvFrJkdYmktA-1
Received: from PHOTON.sldomain.com (192.168.200.17) by isotope.sldomain.com
 (192.168.200.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 24 Aug
 2023 11:33:49 -0600
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by PHOTON.sldomain.com (192.168.200.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 11:33:49 -0600
Received: from BN8PR13MB2818.namprd13.prod.outlook.com (2603:10b6:408:87::29)
 by CO1PR13MB4776.namprd13.prod.outlook.com (2603:10b6:303:f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 17:33:46 +0000
Received: from BN8PR13MB2818.namprd13.prod.outlook.com
 ([fe80::4757:755a:97bc:1c1c]) by BN8PR13MB2818.namprd13.prod.outlook.com
 ([fe80::4757:755a:97bc:1c1c%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 17:33:46 +0000
Message-ID: <4453656b-da97-8a00-0afc-c0d0e7fe627f@spectralogic.com>
Date: Thu, 24 Aug 2023 11:33:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: FreeBSD-Samba 4.16: local user login fails when Active Directory
 domain joined
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR13MB2818:EE_|CO1PR13MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c700b7c-57c0-4628-8673-08dba4c844c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: oXfAZWSVGho0sQ+luTmhFo9yjMMexiwgynZnHCUb16hPRIL6Xi8/W+LrhYcKdDwyCr4kSAdtc+hmLorhwFx6yhCE7jAklm4GU/Jd64/vjC5l4Kin8UkszLi3FREWJ3v2PqnSbkSIKsnQheoagZ9DCMNM9fcI8xN0x73iLRjgm3y225u2FR+jnHvQZTv8fDASmONgrkWnUlb1SuUyN1NffXWfUf2OaH75sm0zozT/HtwIOhPCkdjtF6zwskl3c5HQNzv7vK0NBjdkdKuMQdJoL+8qr8pCEhoXm4+iYSx4fqpIvpUGSLJ6adSb9OwJVeiPPGFBpVMmKiRcrpsIllDWr5p2Aint+cjCvBDmC9skMlNOmdmmZ2LvDCne0xSEWxpNtaEJl9QqDoyoDJI2XFPggzW3DptzUZeZiwjbTy0x+mULPEgwsJzWGBlkTEQgs6hKr+KNZKsmxURrJLv5pA4Db/ohSWI2YrZSCygIg13SBLd6dcjFXGEpIModu/iS/zWb5ilcdZc6KkLEVWs+pB1DhfhgjEdzmkUFm7vlX2ND9V5TNDlpg/Wc62F0q8m3SpdL0ng7JGzJ4Bb3zUzDm2RbPPrskbalF2kCsif+9u6glwjWTOJfFQUs7hoRY6wDjSD5rPjqihYMytYu/ViihOIYU0bG2yu++lfNbnHgGAmYV5cvQND0AIswirINNx2UR1sjMvVlMi9gonJJuJfecsZkTh/gU6ydh7MgWqwU4K9TFaYIqqFJgsdKEkHdMejTdNWI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlWMEFDZjFQNVh2b1dxN2dvdlBndjdHaXpDL0F3UGIyaE5qUklpQ2ZFYmZN?=
 =?utf-8?B?ZEt1MFp6ajV1b2xURitDYUs5QkJ3eXlzMUlLZFo3emhsMXljUlM2QVRpaTYy?=
 =?utf-8?B?UlN3WFJSSDIzMHZUdEZHY09jdkI1SG1vSUlxZ0JEUWsrd0tpcTd4U3AzZGhh?=
 =?utf-8?B?WTFYUzM0bTlIQlozQmU0QXZ3NmlzOHZtaXVlMU5KQnpWYVo2V1RkWnBGSmxw?=
 =?utf-8?B?WUJQdEYzVkhGMFBkWEdQemYwaWFmTHJ4TkxkcjE3eXpnazFlZ2toRisxU0E3?=
 =?utf-8?B?T2l3Tkl0bWFZR0pQTDU4Y0lyelhIVDFBV01hK2k0ODVLNUllV3ZsTkgweldq?=
 =?utf-8?B?MFkrZHF6bWFKcU1rWVRyK2dpOUF1RC8vdmZ2VWo5amE1SlNpZzgrWmxDazl5?=
 =?utf-8?B?SFlZWGpUQmpFcHQ0NXdpVVZjZ1hNRG1sS1NnZThDNWZrTEVlYjgvalA1TzBp?=
 =?utf-8?B?aUc2VlJkM2pMbXdtV2lmWlVXNjZLSFR0Q1dIVHlhSGRPdm5DR0Z2cTN2YVla?=
 =?utf-8?B?WE5lbEdDbWtJVUxWVm9qRDd6Z3Ixak5VUFVJaTA4YUF1RFVIc0xta3pGL2oy?=
 =?utf-8?B?NUdPYk5YSzY4a3hLWXduUncySlZEUnZ6Tm5IZWdLbXJYZGFlTmpESmp5TDhs?=
 =?utf-8?B?YkVEZzJsSkRvSFp5N0dxNVhaRDNSWjFzSFAxM3g5eWE3SkY5VnFYbzBzdlZC?=
 =?utf-8?B?a0VqZzlTdWdsdEZ2ZUU3MHBPVHBpcGVMTXVVRy9CRGlyQnZadm96bXM3RjhD?=
 =?utf-8?B?NGRycHFtY3JGTmE5bVlZT2lFUjltcmRsUFNsaTRrZEZtc2dtUXFqcHd1Z3hG?=
 =?utf-8?B?RGhiQzVTWTRhSjdLdlZrMHhWQkI2dlh4bmg3OWFicTYzTDRBZi9Ba05Ga3Ir?=
 =?utf-8?B?V3Z1a2FVVmFhQ2VIcko3dGNNM0Ivam5ITnJlYUIvMDhXaVgxR0RhaGI5NVhZ?=
 =?utf-8?B?Z09qK2lKZHFiZFJWZWYweUlsbHorNE5uU283QXlDbXcrMS93TnBkM2FoRG9y?=
 =?utf-8?B?VklQRTVJNDhPQVFJSEU5ZW4yTHJVTWU4RThzdUt5eFBOZFhJYm5Ka1loTUUx?=
 =?utf-8?B?dHNzRXNYV1NTM1NZYWQ1MU16YjVCbDZiNEdUU2NEVG5jd2s1Y1FycWltdDVs?=
 =?utf-8?B?MVhXYkVPTDZtTktHRC90VXBEdDRqblNjQzcrSUVUeGFUWUdnOTRBaVNaWCt5?=
 =?utf-8?B?VzFNQWhuRmx0UjFGYUxZTDRUZElYOEVjVC80K24vVURsL1VzMU5EeWZYUzVD?=
 =?utf-8?B?UlEwMmh1Zng5Q0t5cDRoWnNLckRPQU81OS80R04vcEVnbjRmM3lCdzd6SVox?=
 =?utf-8?B?K0R3VkNha0YzUzZUdWhtN21NZTBJenRrVnhPYUN3Vm5GNjE0R3lQVWJ6aktz?=
 =?utf-8?B?NlMzclN6TXU2M1QxWk14dlBjU0JGYVBnQVFHNGVyZERvMjRwKzg3WWFnVXZJ?=
 =?utf-8?B?U1RkUDhodDFkYjBDNVM2Zm9HQW9qTHV3dHZlQ0NDM2drSjZodzBTcEs2dmk0?=
 =?utf-8?B?cldPeG9FcS8xaW4xaVdvT0RFVkN6V09VUTVOdkZXOHdBaE9LejcrZ1FoWDJi?=
 =?utf-8?B?ZDRqK1lPYTFReW5qc0ZibUJQdWhqT2RGT1lCOXRJaDE4ZlpUYmJkUUpwRGxQ?=
 =?utf-8?B?dyt0YXhyZmhrMWlMWmFYMDFNQkVTQUF4OC9menRlS2gza2hCVTdIbVh6NGN6?=
 =?utf-8?B?NGlTVFN3NU1sYmhVL2FtY24rZHNPMWxaVFVBWXFQRkR2T2tqWDY3ZmhYRTZk?=
 =?utf-8?B?Z3RyMGptTUE0eGdDY28xNWJCSDBpZHJSU2dwcldxdFZmMGFnYmFkV1RtYkVJ?=
 =?utf-8?B?TVNudVZJTWFYVjRoUlhNNE1vQkh5cHRhcGVjdnBmMGh1cFBkTHM0cEZIckFs?=
 =?utf-8?B?NkQzdXBSc2V3K0dwcTVIMUNmQkM0aVVEaW5zeUdJUTUrWlIwbytVd0NxNlVv?=
 =?utf-8?B?K3NiSGtnRzVtaUJjSDgwRHZ5dDBTWklicDhLRGlyNnE2Vlc2SUM1Zk5pOGRV?=
 =?utf-8?B?YWxXTGNwWktocVRaMG9GM0kvUGl5SjNSRzJSUDUramprSUl6cjA5em9MUWVu?=
 =?utf-8?B?eDBDZjZLcGFJYXJRNFZVc1RhZmJPcndCRnE2TWQ2bk54d3l4dHBuYlZ4TUVp?=
 =?utf-8?B?QTJFcU5vekRHc0JZQ3RjU1lFU3RtS3hrQWdyYVNFZ1FJT3piU01ZQk9uYU92?=
 =?utf-8?B?Zkx2a1YwOUFUcVAyNjFDYWkwMnhuYzRSMVlxY2MwVE4wamxITi9OcjRJS2ly?=
 =?utf-8?B?ZWhFcEFSRHl2MlhqNC9iNzUxdStRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c700b7c-57c0-4628-8673-08dba4c844c0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR13MB2818.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f45cddc7-ef36-4fa3-af01-5ac8dc31c7be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9G5DVhqBS1SF3RaSgJajNLTSSOt7QLKuyXd9PxluULfxeKjEn2tOK721iKC/zQBAiyNV/CxaVruMKbiDYKbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4776
X-OriginatorOrg: spectralogic.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: spectralogic.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Dave Baukus via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dave Baukus <daveb@spectralogic.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I Recently upgraded from Samba 4.13 to 4.16 on a FreeBSD stable 13.2 platfo=
rm.
When I join a domain there is a brief period in which I can log on as mysel=
f as a local unix user via ssh, but after an indeterminate period all such =
attempts fail.
When the login attempts fail, a prompt does not appear for over 60 seconds =
by which time it is too late to enter the password (ssh gives up ?).
My pam configuration has not changed.

I have noticed that when I can login there are 2 rpcd_lsad processes runnin=
g:

#  ps -axfH -w -o pid,ppid,flags,stat,rss,cputime,etime,mwchan,args | grep =
samba | grep -v grep
87024     1 10000001 Ss    25652      0:00.02        01:03 select   /usr/lo=
cal/libexec/samba/samba-dcerpcd --libexec-rpcds --ready-signal-fd=3D21 --np=
-helper --debuglevel=3D1
87034 87024 10004101 S     29972      0:00.11        01:02 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D5 --debuglev
87175 87024 10004101 S     29880      0:00.11        00:29 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D6 --debuglev

Then something goes wrong and the number of rpcd_lsad processes keeps slowl=
y increasing (seemingly topping out at 9) and I can no longer login:

#  ps -axfH -w -o pid,ppid,flags,stat,rss,cputime,etime,mwchan,args | grep =
samba | grep -v grep
87024     1 10000001 Ss    25652      0:00.08        09:57 select   /usr/lo=
cal/libexec/samba/samba-dcerpcd --libexec-rpcds --ready-signal-fd=3D21 --np=
-helper --debuglevel=3D1
87034 87024 10004101 S     30052      0:00.13        09:56 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D5 --debuglev
87175 87024 10004101 S     30040      0:00.12        09:23 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D6 --debuglev
87630 87024 10004101 S     30020      0:00.12        07:20 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D7 --debuglev
87667 87024 10004101 S     30016      0:00.12        07:10 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D8 --debuglev
87710 87024 10004101 S     30040      0:00.12        07:00 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D9 --debuglev
87773 87024 10004101 S     30064      0:00.12        06:39 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D10 --debugle
87814 87024 10004101 S     30060      0:00.12        06:19 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D11 --debugle
88365 87024 10004101 I     29980      0:00.11        02:56 select   /usr/lo=
cal/libexec/samba/rpcd_lsad --configfile=3D/usr/local/etc/smb4.conf --worke=
r-group=3D4 --worker-index=3D12 --debugle

When the domain is joined, the logs are being are spammed with the followin=
g:

Aug 23 19:32:45 winbindd[54994]: [2023/08/23 19:32:45.229571,  1] ../../sou=
rce3/winbindd/winbindd_dual.c:363(wb_child_request_cleanup)
Aug 23 19:32:45 winbindd[54994]:   wb_child_request_cleanup: keep orphaned =
subreq[0x1104cbbd2200]
Aug 23 19:32:45 samba-dcerpcd[55003]: [2023/08/23 19:32:45.698848,  1] ../.=
./source3/rpc_server/rpc_host.c:1353(rpc_host_distribute_clients)
Aug 23 19:32:45 samba-dcerpcd[55003]:   rpc_host_distribute_clients: Sendin=
g new client /usr/local/libexec/samba/rpcd_lsad to 55084 with 0 clients
Aug 23 19:32:45 samba-dcerpcd[55003]: [2023/08/23 19:32:45.700050,  1] ../.=
./source3/rpc_server/rpc_host.c:1353(rpc_host_distribute_clients)
Aug 23 19:32:45 samba-dcerpcd[55003]:   rpc_host_distribute_clients: Sendin=
g new client /usr/local/libexec/samba/rpcd_lsad to 55248 with 0 clients
Aug 23 19:32:55 winbindd[54994]: [2023/08/23 19:32:55.841898,  1] ../../sou=
rce3/winbindd/winbindd_dual.c:306(wb_child_request_orphaned)
Aug 23 19:32:55 winbindd[54994]:   wb_child_request_orphaned: cleanup orpha=
ned subreq[0x1104cbbd2200]

Increased verbosity shows:

Aug 23 21:23:03 winbindd[75515]: [2023/08/23 21:23:03.173561,  0] ../../sou=
rce3/winbindd/winbindd.c:1061(winbind_client_processed)
Aug 23 21:23:03 winbindd[75515]:   winbind_client_processed: request took 6=
3.167713 seconds
Aug 23 21:23:03 winbindd[75515]:   [struct process_request_state] ../../sou=
rce3/winbindd/winbindd.c:675 [2023/08/23 21:22:00.005840] ../../source3/win=
bindd/winbindd.c:856 [2023/08/23 21:23:03.173553] [63.167713] -> TEVENT_REQ=
_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:    [struct winbindd_getgroups_state] ../..=
/source3/winbindd/winbindd_getgroups.c:54 [2023/08/23 21:22:00.005844] ../.=
./source3/winbindd/winbindd_getgroups.c:111 [2023/08/23 21:23:03.173529] [6=
3.167685] -> TEVENT_REQ_USER_ERROR (3 10483072397370982515))
Aug 23 21:23:03 winbindd[75515]:     [struct wb_lookupname_state] ../../sou=
rce3/winbindd/wb_lookupname.c:47 [2023/08/23 21:22:00.005855] ../../source3=
/winbindd/wb_lookupname.c:95 [2023/08/23 21:23:03.173527] [63.167672] -> TE=
VENT_REQ_USER_ERROR (3 10483072397370982515))
Aug 23 21:23:03 winbindd[75515]:      [struct dcerpc_wbint_LookupName_state=
] librpc/gen_ndr/ndr_winbind_c.c:781 [2023/08/23 21:22:00.005862] librpc/ge=
n_ndr/ndr_winbind_c.c:847 [2023/08/23 21:23:03.173526] [63.167664] -> TEVEN=
T_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:       [struct dcerpc_wbint_LookupName_r_st=
ate] librpc/gen_ndr/ndr_winbind_c.c:693 [2023/08/23 21:22:00.005864] librpc=
/gen_ndr/ndr_winbind_c.c:727 [2023/08/23 21:23:03.173524] [63.167660] -> TE=
VENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:        [struct dcerpc_binding_handle_call_=
state] ../../librpc/rpc/binding_handle.c:371 [2023/08/23 21:22:00.005866] .=
./../librpc/rpc/binding_handle.c:520 [2023/08/23 21:23:03.173521] [63.16765=
5] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:         [struct dcerpc_binding_handle_raw_=
call_state] ../../librpc/rpc/binding_handle.c:149 [2023/08/23 21:22:00.0058=
76] ../../librpc/rpc/binding_handle.c:203 [2023/08/23 21:23:03.173516] [63.=
167640] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:          [struct wbint_bh_raw_call_state] =
../../source3/winbindd/winbindd_dual_ndr.c:93 [2023/08/23 21:22:00.005879] =
../../source3/winbindd/winbindd_dual_ndr.c:208 [2023/08/23 21:23:03.173514]=
 [63.167635] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:           [struct wb_domain_request_state]=
 ../../source3/winbindd/winbindd_dual.c:499 [2023/08/23 21:22:00.005883] ..=
/../source3/winbindd/winbindd_dual.c:734 [2023/08/23 21:23:03.173507] [63.1=
67624] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:            [struct wb_child_request_state]=
 ../../source3/winbindd/winbindd_dual.c:198 [2023/08/23 21:23:03.170852] ..=
/../source3/winbindd/winbindd_dual.c:298 [2023/08/23 21:23:03.173506] [0.00=
2654] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:             [struct tevent_queue_wait_stat=
e] ../../tevent_queue.c:350 [2023/08/23 21:23:03.170854] ../../tevent_queue=
.c:369 [2023/08/23 21:23:03.170856] [0.000002] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:             [struct wb_simple_trans_state]=
 ../../nsswitch/wb_reqtrans.c:375 [2023/08/23 21:23:03.170859] ../../nsswit=
ch/wb_reqtrans.c:432 [2023/08/23 21:23:03.173503] [0.002644] -> TEVENT_REQ_=
DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:              [struct req_write_state] ../.=
./nsswitch/wb_reqtrans.c:158 [2023/08/23 21:23:03.170859] ../../nsswitch/wb=
_reqtrans.c:194 [2023/08/23 21:23:03.170880] [0.000021] -> TEVENT_REQ_DONE =
(2 0))
Aug 23 21:23:03 winbindd[75515]:               [struct writev_state] ../../=
lib/async_req/async_sock.c:267 [2023/08/23 21:23:03.170860] ../../lib/async=
_req/async_sock.c:373 [2023/08/23 21:23:03.170879] [0.000019] -> TEVENT_REQ=
_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:              [struct resp_read_state] ../.=
./nsswitch/wb_reqtrans.c:222 [2023/08/23 21:23:03.170882] ../../nsswitch/wb=
_reqtrans.c:275 [2023/08/23 21:23:03.173503] [0.002621] -> TEVENT_REQ_DONE =
(2 0))
Aug 23 21:23:03 winbindd[75515]:               [struct read_packet_state] .=
./../lib/async_req/async_sock.c:480 [2023/08/23 21:23:03.170883] ../../lib/=
async_req/async_sock.c:568 [2023/08/23 21:23:03.173501] [0.002618] -> TEVEN=
T_REQ_DONE (2 0))
Aug 23 21:23:03 winbindd[75515]:    [struct resp_write_state] ../../nsswitc=
h/wb_reqtrans.c:307 [2023/08/23 21:23:03.173533] ../../nsswitch/wb_reqtrans=
.c:344 [2023/08/23 21:23:03.173551] [0.000018] -> TEVENT_REQ_DONE (2 0))
Aug 23 21:23:03 sm4u-11 winbindd[75515]:     [struct writev_state] ../../li=
b/async_req/async_sock.c:267 [2023/08/23 21:23:03.173534] ../../lib/async_r=
eq/async_sock.c:373 [2023/08/23 21:23:03.173543] [0.000009] -> TEVENT_REQ_D=
ONE (2 0))
Aug 23 21:23:03 winbindd[75515]: [2023/08/23 21:23:03.174437,  1] ../../sou=
rce3/winbindd/winbindd_dual.c:363(wb_child_request_cleanup)
Aug 23 21:23:03 winbindd[75515]:   wb_child_request_cleanup: keep orphaned =
subreq[0x10338ddc5300]


I'm at loss on how to debug or get this working; any clues would be appreci=
ated.


My pam.d/sshd is:

# auth
auth            sufficient      pam_opie.so             no_warn no_fake_pro=
mpts
auth            requisite       pam_opieaccess.so       no_warn allow_local
auth            sufficient      pam_winbind.so          debug try_first_pas=
s require_membership_of=3DBUILTIN\\Users
auth            required        pam_unix.so             no_warn use_first_p=
ass nullok

# account
account         required        pam_nologin.so
account         required        pam_login_access.so
account         required        pam_unix.so

# session
session         required        pam_winbind.so          debug krb5_auth
session         required        pam_permit.so

# password
password        sufficient      pam_winbind.so          debug
password        required        pam_unix.so             no_warn try_first_p=
ass



My smb4.conf is:

[global]
include =3D /etc/smbver.conf
         printcap name =3D /dev/null
         load printers =3D no
         disable spoolss =3D yes
         ntlm auth =3D ntlmv2-only
         strict sync =3D yes
         deadtime =3D 15
         hide dot files =3D no
         template homedir =3D /usr/home
         template shell =3D /usr/local/bin/shellcli
         force unknown acl user =3D yes
         guest account =3D guest
         kernel oplocks =3D no
         eventlog list =3D Application Security System
         max log size =3D 0
         logging =3D syslog file@0
         log level =3D 1
         vfs objects =3D acl_xattr streams_depot freebsd
         freebsd:extattr mode =3D legacy
         acl_xattr:ignore system acls =3D yes
         acl_xattr:default acl style =3D windows
         ea support =3D yes
         streams_depot:delete_lost =3D yes
         store dos attributes =3D yes
         veto files =3D /:STREAM/
         registry shares =3D yes
         idmap config * : backend =3D autorid
         idmap config * : rangesize =3D 1000000
         idmap config * : range =3D 1000000-19999999
         bind interfaces only =3D yes
         security =3D ads
         workgroup =3D XXX
         realm =3D XXX.LOCAL
         allow trusted domains =3D no

--=20
Dave Baukus


