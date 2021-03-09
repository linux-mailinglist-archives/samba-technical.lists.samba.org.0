Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B0332DF7
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 19:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=epjMyNDVOwBDrZNwzFAifyFVWtBSQIDJ6UAJMXfaa9o=; b=0sQ5kLDIW6ufbW4/GxxxeB+FHo
	sIYcWrF/D96XudaGoid+8YYO1ieSIJ2egRYGcFLJahsJqm0NO2MYitI0jr9lu30T8qsQ5p7+UtYCY
	8yCMy6u0GqvU4+PWmEY+cdZiMrlXY9DRBvhG/QyCvOFns4fG5re0x0wuNBd/47PrggfZaHHqzQeIO
	TvLO+DbOm+JLNZFop7gqkS2pQjJ5YaKp0tgmg7XGpFhzeREMRyCYkK4Iif7YhhKTgVo098ydkB6GG
	XXio1EOKVQZvfw1xcAjJTVavejn0LPLtFB3mZnI8786cpjEyLxk7ojmDLKKo7zfTiNrUuCbYyOg/z
	DpysOo3g==;
Received: from ip6-localhost ([::1]:58126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJgsF-004g41-2t; Tue, 09 Mar 2021 18:14:27 +0000
Received: from mail-eopbgr130052.outbound.protection.outlook.com
 ([40.107.13.52]:62219 helo=EUR01-HE1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lJgs9-004g3u-LB
 for samba-technical@lists.samba.org; Tue, 09 Mar 2021 18:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9OUOCjARXTw125VbY/VcpleAhcOC0B4WGZcH7ZH0IM2ceqimNb+geauVEVZDytRCal7uVxskaIkpaBEEnx5XGJ4fDbTvlZJaDnUDOj/U63wpsDQeCA2U5eQwloXQhTDJ7gX0wnpZnjrO8lTzL51ylEmrLe1wdkatJGnzQLVDhCnRdA6GrC6P1CbYog5h5EsmhdzL42gICypE3EVENjTgfuzK6132LtYZLoRuz1AozU2LDW5XFzaKRYMhLoXMUF0MyaJpF5xh4+sY+00jFsYr1yhCapEaZGbyCTRhcnKtg20ozVxIzdRsqJYQ76kbqPEMd0y6f9L3jmwQhlUF+gRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epjMyNDVOwBDrZNwzFAifyFVWtBSQIDJ6UAJMXfaa9o=;
 b=ctu4eUe9VHirx5d5U9/rKJlgHnkELkeGqpDURZcpwgdfTZUUutIhvnAAeZJDBIr2lEi9OFTFBOV9mXhfVHK+B8XMOqSAz4hiyvqEKvmd8yYHoEQIaZcaZ+MEekgaZXyNXiBJdrhaMMsuppqRe0pflTvwF4/jkvBzVb/8iT5a0pj5057iOUq5b/xGZP1KcERM+aDHLQMlTMFQ++uvVjbI6bZ8KlpbIQ0tI2V6FIgdlto6/meh62aSErWQNRM4sNJ/OFSmB02hQwnWz2xGenbvm1HOeOsvDo9eJGiKn+JtFEz083Yei3d2AljHFjzbfqcTUVLzpmRX0OGz1uJ8nuoiLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digitx.de; dmarc=pass action=none header.from=digitx.de;
 dkim=pass header.d=digitx.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitxgbr.onmicrosoft.com; s=selector2-digitxgbr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epjMyNDVOwBDrZNwzFAifyFVWtBSQIDJ6UAJMXfaa9o=;
 b=t4G40sjZKHBI05KFIgMebvDzfnWw99FH4pCJLxbiX3p94zXwVETdriK8xY+Au3zbDM6NGMhtYtpjGge2YufI3uUHztvPMd0qgAGd1PLgzZ9Dxn5U3wdCq9kkvsDcTYwdTDnBjFPyHzK87HX+wwsdk3fMnQ+gHZ2ZbTPAvrskP9M=
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com (2603:10a6:20b:2c8::19)
 by AM0PR05MB5825.eurprd05.prod.outlook.com (2603:10a6:208:11e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Tue, 9 Mar
 2021 18:14:07 +0000
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::702c:c93d:a4e8:145c]) by AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::702c:c93d:a4e8:145c%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 18:14:07 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: RE: "make test" of samba master fails in a privileged Linux container
Thread-Topic: RE: "make test" of samba master fails in a privileged Linux
 container
Thread-Index: AdcVDrRrEeyxs4OxTO6L58Ikj5aNOg==
Date: Tue, 9 Mar 2021 18:14:07 +0000
Message-ID: <AM9PR05MB7636520C0401F4982454EAFECF929@AM9PR05MB7636.eurprd05.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=digitx.de;
x-originating-ip: [93.217.244.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb1d45e8-2106-4f0f-adc7-08d8e3272152
x-ms-traffictypediagnostic: AM0PR05MB5825:
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +5YASdxXpi057eRO3JXcMyJgXtLnyYS3z40cNUySCKssLX/s62VJAhD8Vc2Jl83YDJA3Zu1bSA3XkHDxXlqYntUcoFUoQ2YTkKOwbTHloFp4RYBVtZmqKj4lNhXrUgJ2XO+U3hGyHN8O0/Gsa3vCGCIAtAb8PNNbOD+nQ0h/Tatt3cdA3T03C/mm7Is5pyk5BcHhRzJPPulTcjSUFV96bUR7BIFwp8zHAnNpEvc/NJSke1Q2EVCmPYhsG/x3WDczKPNEv2xT8W36z38fX0ZErnewdAJiXc3VXArlT+t3IUKfQGt9xjfzZJC2OjsOGDwMn88QmanJKe/G5Kzz70pKXc6PrEVRaTI0zj6sEzVx7Anm0wxWp1BYodUnnPbEb3VGytmRHQPVHjf+SPJagMugha9qNdBHC/BxZY1iZS472P+5237xlymYAhBZxVjYE/+7lWeA8OKP+0Vts7XLFto7fucp77KjBXkC7+kpRSQMr8E07T8u0DfSQb0jnhTmGKHFqf2pc1YRiMcAwxJ+7wvQlzCXiBIvSaR8sUoqbSd8gUXmTQUGQXZ8YTotgmolQ6R6PoVikNE1RqXMtX5yk5v2hdr4l1rFb16f4+LZwEVzipM=
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P/yd9e5jdNy0XEktdw/TU90ltBtig3FsE/eufpyXxTRj3tLFS81n4/NiXMvq?=
 =?us-ascii?Q?U3uiHRm/KjoQl/5d0j0Tusvbq7eSqFEbxTWa/Rm4kEO814FqI2/omEjkGScj?=
 =?us-ascii?Q?oLMN16og9bEjWuzlSO0zrwvJ+QIsIWIF+gWCw2y+mrQmirczajTGMLANFHfm?=
 =?us-ascii?Q?VqTgckC9euB1NF1sqCqrdbrSyKrU0pUfMXdyKGsAeP4BdbkkTzmTKa+TXgZZ?=
 =?us-ascii?Q?+NqojpOoehWWZATQRXrB7udkg5lXJdzr6eNeGegBaqTqnRa68HH61ZahKFu4?=
 =?us-ascii?Q?ozyRWZwI9Ah2BQxeUHDtmftBlQCSw7HV5cMw5ABKGBB7Fa8NyagO+7dedhZl?=
 =?us-ascii?Q?ZjsfNQS8RWWLVq+AzG7CAaORuSXH03PT3MKYwx1+Ea1qO2FAAp/ZHr/z/Hy2?=
 =?us-ascii?Q?3yZec69jwuTAp8XmVcFesf88LTkgfQCLeTUI6aWx7DUz3QauAteSJkkGW4G7?=
 =?us-ascii?Q?ypgsFwyyVmfEETKM86mmRRSuEF/FIXEWm99tnLaxQsv2z8zVpaDy1tWtwnIj?=
 =?us-ascii?Q?W+IlcNSu5Vj2R7SrGjUVMj2vsfRPneoKEzrkjWMevf0iEpz3fDdfgkGBY9ma?=
 =?us-ascii?Q?60lIUTR9O/nwd4Y4rvlcTFPs6E8iubR0gUuHh/IBlDaeFPl4hRYjwfMFY9qb?=
 =?us-ascii?Q?GEitT4y8N29JpBeXtgf+6vgtB2mJePQ24FqMVWD1Mcd2GqPiwBLwP+fJqpmu?=
 =?us-ascii?Q?BB+MOJFUwPFlx+OVglYHHjdWvPKo6EpRAfG2pxuLCsFaZ3zXElMI8IHEq+6P?=
 =?us-ascii?Q?W6JlL+tvU2/tTjm3RTtnlOmQfTDVUM8AKH9NosODgvGbn6OYXPeHurVZYxBT?=
 =?us-ascii?Q?srLBlOh2liuuyb7iwvIRE9XgKfxSNLvHsg/r+Oa2DlHdDZazEFbCw+T4EzBv?=
 =?us-ascii?Q?2Ssn7KXOEp3+q0BXMlbGTPHFJ34VhCSfkx1tBvLnsG/sk5pMdX4rgvU+92rA?=
 =?us-ascii?Q?GjAtGsdar4kwTxUN3bgcIfuutFQBGR1zNE9uKSlDgA3Xq4xqu0Zekfi04uoF?=
 =?us-ascii?Q?h9hIs9Y0nsSUPpKP3f/EV0qKYzbUVdC9v1uLk+hnG34rQvxff5H+78a2bW9K?=
 =?us-ascii?Q?Ihvc6xdibxlT5QNvvZ0qsAK1YqRSKzwdKNXhiZRK22vgxPW7EYoUsKI0Ugtg?=
 =?us-ascii?Q?oMEMoUFN3IHfGdkszCsBS8tM3kR9AX5aYrCjIzcTK8REgUM6FLv2OdblAxIH?=
 =?us-ascii?Q?T0bPY82XbRXuCyrgcJ880yCa6u/MvYzNE4mwIfsz3qi7K4HsNtCbirAm1nhK?=
 =?us-ascii?Q?rRZVyVzHoQqWqoJadVubub8TSVmpwrT4BX2aM4S0/Mh/7CKTTbjD4Sl2biso?=
 =?us-ascii?Q?2GU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: digitx.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB7636.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1d45e8-2106-4f0f-adc7-08d8e3272152
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 545eefb3-8b20-4e2a-bcdb-884c876d0f6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bx/+A0xRNShlWd7jexhmborrIOsqOf/3t4VESyGENjfa6eVgucUtYQaD/6W/xwwVNaTOrPcT7hp2BrwpbDag7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5825
X-Warn: EHLO/HELO not verified: Remote host 40.107.13.52
 (mail-eopbgr130052.outbound.protection.outlook.com) incorrectly presented
 itself as EUR01-HE1-obe.outbound.protection.outlook.com
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
From: Thomas via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas <tgeppert@digitx.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2021-02-28 at 10:56 PM, Andrew Bartlett via samba-technical wrote:
> Patches to make 'make test' require a TESTS=3D parameter might be a good =
idea, to set expectations correctly, users wanting to at least run over the=
 whole testsuite anyway could run with "TESTS=3D.".

Following the advice I did run "make test TESTS=3D'^samba3.smb2.acls'" and =
was surprised to see this fail with:

FAILED (20 failures, 0 errors and 0 unexpected successes in 2 testsuites)

A summary with detailed information can be found in:
  ./st/summary
TOP 10 slowest tests
samba3.smb2.acls(ad_dc) -> 8
samba3.smb2.acls(nt4_dc) -> 5
ERROR: test failed with exit code 1
make: *** [Makefile:16: test] Error 1

Was that to be expected or is something wrong with my setup (which was desc=
ribed here in more detail: https://lists.samba.org/archive/samba-technical/=
2021-February/136345.html ) ?

-----------
Thanks
Thomas


More details on the failed test:

[2(13)/2 at 13s, 1 errors] samba3.smb2.acls(ad_dc)
smbtorture 4.15.0pre1-DEVELOPERBUILD
Using seed 1615311306
TESTING SID_CREATOR_OWNER
get the original sd
set a sec desc allowing no write by CREATOR_OWNER
try open for write
UNEXPECTED(failure): samba3.smb2.acls.CREATOR(ad_dc)
REASON: Exception: Exception: (../../source4/torture/smb2/acls.c:162) Incor=
rect status NT_STATUS_OK - should be NT_STATUS_ACCESS_DENIED
TESTING FILE GENERIC BITS
get the original sd
Testing generic bits 0x00000000
UNEXPECTED(failure): samba3.smb2.acls.GENERIC(ad_dc)
REASON: Exception: Exception: (../../source4/torture/smb2/acls.c:441) Incor=
rect access_flags 0x001f01ff - should be 0x00070080
TESTING FILE OWNER BITS
get the original sd
WARNING!: open succeeded with access mask 0x00000001 of expected 0x00000082=
 - should fail

UNEXPECTED(failure): samba3.smb2.acls.OWNER(ad_dc)
REASON: Exception: Exception: (../../source4/torture/smb2/acls.c:774) Incor=
rect status NT_STATUS_OK - should be NT_STATUS_ACCESS_DENIED
TESTING ACCESS BASED ENUMERATION
get the original sd
owner_sid is S-1-5-32-544
UNEXPECTED(failure): samba3.smb2.acls.ACCESSBASED(ad_dc)
REASON: Exception: Exception: (../../source4/torture/smb2/acls.c:2342) SD 0=
x20081 - can see file smb2-testsd
Doing a full scan on DC=3DForestDnsZones,DC=3Daddom,DC=3Dsamba,DC=3Dexample=
,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Daddom,DC=3Dsamba,DC=3Dexample=
,DC=3Dcom and looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Daddom,DC=3Dsamba,DC=3Dexample,=
DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Daddom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and lookin=
g for deleted objects
TESTING OWNER RIGHTS
get the original sd
UNEXPECTED(failure): samba3.smb2.acls.OWNER-RIGHTS(ad_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/acls.c:2487: cr.ou=
t.maximal_access & ~SEC_STD_DELETE was 1966591 (0x1E01FF), expected 1179787=
 (0x12008B): Wrong maximum access
python3: lpcfg_do_global_parameter: WARNING: The "lanman auth" option is de=
precated
python3: lpcfg_do_global_parameter: WARNING: The "lanman auth" option is de=
precated
python3: lpcfg_do_global_parameter: WARNING: The "server schannel" option i=
s deprecated
TESTING OWNER RIGHTS DENY
get the original sd
UNEXPECTED(failure): samba3.smb2.acls.OWNER-RIGHTS-DENY(ad_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/acls.c:2622: cr.ou=
t.maximal_access & ~SEC_STD_DELETE was 1966591 (0x1E01FF), expected 1179784=
 (0x120088): Wrong maximum access
/root/dev/samba/bin/smbd: synthetic_pathref: stat [smb2-testsd] failed: No =
such file or directorysynthetic_pathref: stat [smb2-testsd] failed: No such=
 file or directoryadd_current_ace_to_acl: malformed ACL in file ACL ! Deny =
entry after Allow entry. Failing to set on file smb2-testsd/owner_right_den=
y1.txt.
TESTING OWNER RIGHTS DENY1
get the original sd
UNEXPECTED(failure): samba3.smb2.acls.OWNER-RIGHTS-DENY1(ad_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/acls.c:2764: cr.ou=
t.maximal_access & ~SEC_STD_DELETE was 1966591 (0x1E01FF), expected 1179787=
 (0x12008B): Wrong maximum access
/root/dev/samba/bin/smbd: synthetic_pathref: stat [smb2-testsd] failed: No =
such file or directorysynthetic_pathref: stat [smb2-testsd] failed: No such=
 file or directoryadd_current_ace_to_acl: malformed ACL in file ACL ! Deny =
entry after Allow entry. Failing to set on file smb2-testsd/test_deny1.txt.
get the original sd
UNEXPECTED(failure): samba3.smb2.acls.DENY1(ad_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/acls.c:2902: cr.ou=
t.maximal_access & ~SEC_STD_DELETE was 1966591 (0x1E01FF), expected 1441931=
 (0x16008B): Wrong maximum access
teardown_env(nt4_dc)
teardown_env(ad_dc)
dns_hub: after poll()
dns_hub[UDP[10.53.57.64]]: before shutdown()
server_stdin_handler: samba: EOF on stdin - PID 10596 terminating
TESTING OWNER RIGHTS DENY
get the original sd
UNEXPECTED(failure): samba3.smb2.acls.MXAC-NOT-GRANTED(ad_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/acls.c:3016: statu=
s was NT_STATUS_OK, expected NT_STATUS_ACCESS_DENIED: Wrong smb2_create res=
ult
command: /root/dev/samba/bin/smbtorture  $LOADLIST --configfile=3D$SMB_CONF=
_PATH --option=3D'fss:sequence timeout=3D1' --maximum-runtime=3D$SELFTEST_M=
AXTIME --basedir=3D$SELFTEST_TMPDIR --format=3Dsubunit --option=3Dtorture:p=
rogress=3Dno --option=3Dtorture:sharedelay=3D100000 --option=3Dtorture:writ=
etimeupdatedelay=3D500000 --target=3Dsamba3 //$SERVER/tmp -U$USERNAME%$PASS=
WORD smb2.acls 2>&1  | python3 /root/dev/samba/selftest/filter-subunit --fa=
il-on-empty --prefix=3D"samba3.smb2.acls." --suffix=3D"(ad_dc)"
expanded command: /root/dev/samba/bin/smbtorture  $LOADLIST --configfile=3D=
/root/dev/samba/st/client/client.conf --option=3D'fss:sequence timeout=3D1'=
 --maximum-runtime=3D1200 --basedir=3D/root/dev/samba/st/tmp --format=3Dsub=
unit --option=3Dtorture:progress=3Dno --option=3Dtorture:sharedelay=3D10000=
0 --option=3Dtorture:writetimeupdatedelay=3D500000 --target=3Dsamba3 //addc=
/tmp -UAdministrator%locDCpass1 smb2.acls 2>&1  | python3 /root/dev/samba/s=
elftest/filter-subunit --fail-on-empty --prefix=3D"samba3.smb2.acls." --suf=
fix=3D"(ad_dc)"
ERROR: Testsuite[samba3.smb2.acls(ad_dc)]
REASON: Exit code was 1


dns_hub[UDP[10.53.57.64]]: after serve_forever()dns_hub[UDP[10.53.57.64]]: =
after shutdown()
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: before shutdown()

dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: after serve_forever(=
)dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: after shutdown()

dns_hub: before exit()

FAILED (20 failures, 0 errors and 0 unexpected successes in 2 testsuites)

A summary with detailed information can be found in:
  ./st/summary
TOP 10 slowest tests
samba3.smb2.acls(ad_dc) -> 8
samba3.smb2.acls(nt4_dc) -> 5
ERROR: test failed with exit code 1
make: *** [Makefile:16: test] Error 1

