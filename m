Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAD19DC02
	for <lists+samba-technical@lfdr.de>; Fri,  3 Apr 2020 18:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lbwP5MJrUDbHtunxIOroUNURJo1Jf8qfLb3vnkM6V4M=; b=Pgl5N6XugHHJ0TJrzgBXXq6soP
	ve6UGY6ZZHAF43NB4M1fez1x9x/zvhKWXRssJpS3cI/mRVdmIci5WHIQChlnJmobgEzBNGgzKkd5F
	Pku1yvHwW0hTv9YKc9QU4/hJ6SaLd7Luq2VzeX+XOjbx+djjll/ngl6WEAUAWSzpuWEzZfWzDhYu7
	lUF3KMCzLNeaqhcU/v3bkhDkrBgeTSwaXwn9g+DISTa+C41wOtT6JX8y6OOlsqG9qHBArKdXrUCaP
	EwncycMidTUudSCsxIEi4/bhAZ8lEOzPNGiMoirMoiifUH/cqMUtM3N1QV7sxX2lGe5gkKwV3IIoY
	sUl+iQjg==;
Received: from localhost ([::1]:56370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKPVO-003E7Y-4X; Fri, 03 Apr 2020 16:49:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59134) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKPVG-003E7R-Oi
 for samba-technical@lists.samba.org; Fri, 03 Apr 2020 16:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lbwP5MJrUDbHtunxIOroUNURJo1Jf8qfLb3vnkM6V4M=; b=382AkVH00iru8xoWFmzvbKAvOD
 dEhXj9kb73s4Snp77ZK8RzEHLA/TJeZSeReSb2GF1X+8+8FzSg9NzRKovJnJDZRWbrHQqmFuaNXqT
 pJGYeSEObCZGcTcVyU8vqKbDRg+tYCnidUGliqZIYjF95n/3Pfc3V9FIrNE79z+PvzZmtlumMlvrc
 XtGrL0xK3YahleEDf0azzdLjIr8JdMMy68DX6cAJvpR8WSIqHV4/3Gh/gqOZLTy7DuGSjlzheGR1n
 ibNk0+sL4KseC0ihNI35cAXC4tJoW+APdmeI+UGVZfllGYuxw0S1xc5VFKnbw6rxQ3W8p/qnHtSLR
 tRbSnWQbn0SGsYzJAJ08DTbLDX+pnq0jw+wedqm/QC0G1fq4FIDb57LhgwhlIBRMJ5ufzkkUYMl5o
 o2R6+ZP/Z4s+xIhjfo5PwJV+Ysg/feY/H4t4+2FQt4akK1ljGXvBWKA78U8lJbTDalU3ZdcsTwenH
 yLz1oUIoIbGY8NKqrSHQ6O9u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKPVD-0004dJ-Rp; Fri, 03 Apr 2020 16:49:08 +0000
Date: Fri, 3 Apr 2020 09:49:00 -0700
To: Noel Power <noel.power@suse.com>, slow@samba.org
Subject: [slow@samba.org: [SCM] Samba Shared Repository - branch master
 updated]
Message-ID: <20200403164900.GA12127@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks so much for all your hard work on this Noel,
and thanks Ralph for all the review hours !

It's so great to see this go in finally !

Jeremy.

----- Forwarded message from Ralph B=F6hme <slow@samba.org> -----

Date: Fri,  3 Apr 2020 16:46:02 +0000 (UTC)
=46rom: Ralph B=F6hme <slow@samba.org>
To: samba-cvs@lists.samba.org
Subject: [SCM] Samba Shared Repository - branch master updated

The branch, master has been updated
       via  23349f9d2c2 selftest: Add list of tests to be ported
       via  182635bb78b selftest: Don't skip smb1 tests and remove associat=
e skip file
       via  1840e96597a selftest: Create instructions for generating skip f=
ile entries
       via  adba4165a56 selftest/knownfail.d: samba3.blackbox.smbclient_bas=
ic.NT1.smbclient
       via  e7b4b349069 selftest/knownfail.d: Add samba4.blackbox.smbclient
       via  84ba205d1df selftest/knownfail.d: Add samba4.smb.signing disabl=
ed
       via  eafdbba6e1f selftest/knownfail.d: Add entries for samba3.unix.w=
hoami
       via  0721eed9727 selftest/knownfail.d: Add samba3.blackbox.smbclient=
_s3.NT1
       via  ecaaef4ff7e selftest/knownfail.d knownfail samba3.blackbox.smbc=
lient_auth.plain
       via  6d67a89a88c selftest/knownfail.d Add samba3.blackbox.smbclient_=
ntlm.plain (NT1)
       via  04639604882 s4/selftest: Move samba4.rpc.join tests to ad_dc_de=
fault_smb1
       via  e362ad23ee6 s4/selftest: Move samba4.ldap.passwordsettings to a=
d_dc_default_smb1
       via  15536417247 s4/selftest: Move samba4.ldap.nested-search to ad_d=
c_default_smb1
       via  c83fafacbb6 s4/selftest: Modify samba4.blackbox.chgdcpass to us=
e smbclient(s3)
       via  89476feec1c s3/selftest: Move samba3.smbtorture_s3.vfs_aio* to =
fileserver_smb1
       via  58623e53485 selftest: Modify fileserver_smb1 with vfs_aio params
       via  07ccb8c70bb s3/selftest: Move samba3.smbtorture_s3.hidenewfiles=
 to fileserver_smb1
       via  f7456c8be9c selftest: Add 'hide new files timeout' related data=
 to fileserver_smb1
       via  9161cf7495c s3/selftest: Move tests raw.samba3hide, raw.samba3c=
heckfsp & raw.samba3closeerr
       via  2b1cca4c514 s3/selftest: Move tests raw.samba3hide, raw.samba3c=
heckfsp & raw.samba3closeerr
       via  65aa21b8e7d s3/selftest Move samba3.smbtorture_s3.plain.RENAME-=
ACCESS to nt4_dc_smb1
       via  aa688a8de69 s4/selftest: Move samba.tests.libsmb to nt4_dc_smb1
       via  628ff67b723 s3/selftest: Move samba3.unix.whoami to nt4_dc_smb1
       via  6820a8cd9a3 s3/selftest Move samba3.smbtorture_s3.plain.MANGLE-=
ILLEGAL to ad_dc_smb1
       via  2668459b90b s3/selftest: Move samba3.smbtorture_s3.plain.POSIX*=
 to nt4_dc_smb1
       via  63784fd6ef8 s3/selftest: Move samba3.smbtorture_s3.crypt.POSIX*=
 to nt4_dc_smb1
       via  a78f7478673 s3/selftest: Move samba3.smbtorture_s3.crypt_server=
=2ETORTURE to nt4_dc_smb1
       via  a20ad8674bc s3/selftest: Move samba3.smbtorture_s3.crypt_client=
=2E* to nt4_dc_smb1
       via  b527816cc9d s3/selftest: Move rpc.samba3.netlogon & rpc.samba3.=
sessionkey to nt4_dc_smb1
       via  a762e8c6739 s3/selftest: Move samba3.rpc.lsa.lookupsids to nt4_=
dc_smb1
       via  29c340bcaff s3/selftest: Move samba3.raw.session to nt4_dc_smb1
       via  3a9e6782bf8 s3/selftest: Move samba3.raw.search to nt4_dc_smb1
       via  9fa64617709 s3/selftest: Move samba3.raw.samba3posixtimedlock t=
o nt4_dc_smb1
       via  fce023d649f s3/selftest: Move samba3.raw.samba3posixtimedlock t=
o ad_dc_smb1
       via  3fd9c4ac092 s3/selftest: Prep commit split handling for raw.sam=
ba3posixtimedlock
       via  9fab393a9c3 s3/selftest: Move raw.samba3checkfsp, raw.samba3hid=
e & raw.samba3closeerr
       via  4d9506deae8 s3/selftest Move samba.raw.read to nt4_dc_smb1
       via  e4bdeabf1d4 s3/selftest: Move samba3.raw.notify & samba3.raw.op=
lock to nt4_dc_smb1
       via  be21c8b76a3 s3/selftest: Use variable for test env rather than =
hardcoding
       via  f35120b0286 s3/selftest: Move samba3.raw.chkpath to nt4_dc_smb1
       via  c9b13ca09fc s3/selftest: Move samba3.raw.acls* to nt4_dc_smb1
       via  718fea5cd8c s3/selftest: Move samba3.blackbox.smbclient_s3.NT1.=
sign to nt4_dc_smb1
       via  bcca2563416 s3/selftest: Remove unnecssary for loop
       via  227095bb790 s3/selftest: Move samba3.blackbox.smbclient_ntlm.pl=
ain to nt4_dc_smb1
       via  e848ad1232c s3/selftest: Move samba3.rap.sam to nt4_dc_smb1
       via  18ffea5e895 s3/selftest: Move samba3.blackbox.smbclient_large_f=
ile*NT1 to nt4_dc_smb1
       via  f9b1ef8eff1 s3/selftest: Move samba3.blackbox.smbclient_s3.NT1.=
plain to nt4_dc_smb1
       via  da0dc866b37 s3/selftest: Remove unnecessary for loop
       via  691ef77fe88 s3/selftest: Move samba3.blackbox.smbclient_s3.NT1.=
crypt to nt4_dc_smb1
       via  c8ddcc822a8 s3/selftest: Remove unnecessary 'for' loop
       via  0c88b2b1f85 s3/selftest: Move samba3.blackbox.smbclient_auth.pl=
ain to _smb1_done
       via  dd7218371a2 s3/selftest: Move samba3.base.rw1 to nt4_dc_smb1
       via  b05f3476955 s3/selftest: Move samba3.raw.lock & samba3.base.loc=
k to nt4_dc_smb1
       via  572bc3e643c s4/selftest: Adjust samba4.blackbox.pkinit to use (=
s3) smbclient
       via  4c924893831 s4/selftest: Move samba.tests.net_join_no_spnego to=
 ad_dc_smb1
       via  6edb46682df s4/selftest: Move samba.tests.auth_log_pass_change =
to ad_dc_smb1
       via  fc1121bc6ba s4/selftest: Move samba.tests.auth_log to ad_dc_smb1
       via  53532fed641 s3/selftest: Move samba3.blackbox.smbclient_ntlm.pl=
ain NT1 to _smb1_done
       via  a166ddc740a s4/selftest: Move samba4.smb.spnego to ad_dc_smb1
       via  ed3b15b33c3 s4/selftest: Move samba4.rpc.join tests from ad_dc =
to ad_dc_smb1
       via  b0564253402 s4/selftest: Move failing samba4.rpc.authcontext.* =
(ad_dc) to ad_dc_smb1
       via  1c8974b421c s4/selftest: run samba4.libsmbclient.*.NT1.* tests =
in ad_dc_smb1
       via  0aa44c88d21 s4/selftest: move samba4.dfs.domain to ad_dc_smb1
       via  3b4e7dbd090 s3/selftest: Move samba3.rpc.samba3.netlogon to ad_=
dc_smb1
       via  83f1a9a2505 s3/selftest: Move samba3.raw.search to ad_dc_smb1 e=
nvironments
       via  543553fe148 s3/selftest: Move samba3.raw.read to ad_dc_smb1
       via  59eb2724891 s3/selftest: Move samba3.raw.acls to ad_dc_smb1 env
       via  8bce1a1bf5b s3/selftest: Move samba3.base.rw1 to environment ad=
_dc_smb1
       via  e71c2753136 s3/selftest: Move samba3.raw.session* to ad_dc_smb1
       via  53c3612da02 s3/selftest: Move samba3.raw.chkpath to ad_dc_smb1
       via  9f152ae85ea s3/selftest: Move samba3.unix.whoami* tests to ad_d=
c_smb1
       via  8ab2c60305d s3/sefltest: Move samba3.rap.sam to ad_dc_smb1 envi=
ronment
       via  fbd63bad461 s3/selftest: Move samba3.base.createx_access to ad_=
dc_smb1 env
       via  90a493acdf3 s3/selftest: Move various samba3.raw tests to _smb1=
 env
       via  f7329c0dcf6 s3/selftest: Move various samba3.rpc.* tests to ad_=
dc_smb1
       via  1368124731e s3/selftest: Move samba3.unix.info2 to ad_dc_smb1 &=
 nt4_dc_smb1
       via  25efadd5f36 s3/selftest: Move samba3.rap.basic & samba3.rap.rpc=
 to _smb1 env
       via  e16aba83fc5 s3/selftest: Move various samba3.base.* tests to _s=
mb1 environment(s)
       via  08171c03926 s3/selftest: move base.delaywerite, base.deny1 & ba=
se.deny2 to _smb1 env
       via  f3ae2dcec1c s3/selftest: Move samba3.smbtorture_s3.plain.* test=
s to fileserver_smb1
       via  422e6c5a795 s4/selftest: adjust samba.blackbox.pdbtest to use (=
s3) smbclient
       via  7e04d84b5f1 s4/selftest: Adjust samba4.blackbox.samba_tool to u=
se (s3) smbclient
       via  1c3f954ab48 s4/selftest: Use (s3) smbclient for test samba4.bla=
ckbox.kinit
       via  3558332228c s4/selftest: Use s3 smbclient for samba4.blackbox.b=
ogusdomain
       via  87d77b3ea9f s4/selftest: Add smbclient (s3 version) binary to s=
4/tests
       via  2b35d8e07b5 s3/selftest: move samba3.blackbox.smbspool to ad_dc=
_smb1
       via  32506f2853a selftest: Move samba3.blackbox.net.misc NT1 to ad_d=
c_smb1 env
       via  df4b8b80b3e s3/selftest: Change samba3.blackbox.net.misc desc. =
to include protocol
       via  c86171aa8b0 s3/selftest: Move samba3.blackbox.net.misc to ad_dc
       via  47ad2551b44 selftest: Move samba3.blackbox.shadow_copy2 NT1 to =
fileserver_smb1
       via  6accac62916 selftest: samba3.blackbox.* so it can run SMB1 & >=
=3D SMB2
       via  a11c58c5f96 autobuild: Add ad_dc_default_smb1 to autobuild jobs
       via  02a16b31710 selftest/target: Add test environment ad_dc_default=
_smb1_done
       via  ffe856ce328 autobuild: Add nt4_dc_smb1_done to autobuild jobs
       via  ba3fe03b510 selftest/target: Create nt4_dc_smb1_done env (alias=
 for nt4_dc_smb1)
       via  814a6d43f4d autobuild: Add fileserver_smb1_done to autbuild jobs
       via  4948dfc63dc selftest/target: Add new alias environment fileserv=
er_smb1_done
       via  bbce98c264f autobuild: Add ad_dc_smb1_done to autobuild jobs
       via  7dbfdd8121c selftest/target: Add new alias environment ad_dc_sm=
b1_done
       via  f1139ac5c60 selftest/target: create return_alias_env function f=
or Samba3.pm
       via  e468b03fc44 autobuild: Add ad_dc_default_smb1 to autobuild jobs
       via  34b14c4fd2e selftest/target: Add new alias env ad_dc_default_sm=
b1
       via  82e4dd50253 autobuild: Add new nt4_dc_smb1 env to jobs
       via  3e5131e06d5 selftest/target: Create new nt4_dc_smb1 environment
       via  087eb9d7448 script: Add ad_dc_smb1 to autobuild jobs
       via  b0ea347c507 selftest: Create new test env ad_dc_smb1
       via  fc0d10d0235 selftest/manage-ca: Add certificiate etc. for DC ad=
dcsmb1
       via  1954972cfdb script: Add testenv fileserver_smb1 to autobuild jo=
bs
       via  fcae89684ed selftest: Add new test environment fileserver_smb1
       via  e13e0cf0ceb selftest: adjust skip_file (after adjusting s4membe=
r and rpc_proxy)
       via  f64e032a355 selftest: Allow rpc_proxy & s4member also negotiate=
 SMB1
       via  49ba8f21555 selftest: disable SMB1 from testenv(s) make >=3DSMB=
2 the default
       via  7f2cdadfef3 selftest: Exclude SMB1 tests that would fail when S=
MB1 is disabled
       via  10c879a98b9 selftest: Create a file to exclude tests that fail =
with SMB1
       via  5898c723185 selftest: Allow ad_dc_ntvfs negotiate smb1 still
       via  0f83d9153cd s3/selftest: Fix typo in test generator script
       via  a45e6370250 selftest: allow SMB1 in clusteredmember env
      from  84c130a6555 samba-tool group show: only shows global security g=
roups, this patch makes it show all groups.

https://git.samba.org/?p=3Dsamba.git;a=3Dshortlog;h=3Dmaster


- Log -----------------------------------------------------------------
commit 23349f9d2c27d66a572ea2ffb2d628f251ce9fd6
Author: Noel Power <noel.power@suse.com>
Date:   Thu Mar 5 11:46:37 2020 +0000

    selftest: Add list of tests to be ported
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>
   =20
    Autobuild-User(master): Ralph B=F6hme <slow@samba.org>
    Autobuild-Date(master): Fri Apr  3 16:45:48 UTC 2020 on sn-devel-184

commit 182635bb78b17d4b93129d708337312477ed34ad
Author: Noel Power <noel.power@suse.com>
Date:   Tue Dec 10 16:10:20 2019 +0000

    selftest: Don't skip smb1 tests and remove associate skip file
   =20
    remove the skip file and the code to use it from the build as
    all tests now run in either specific smb1 enabled envs or normal
    (non smb1) envs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 1840e96597a58d31aca4a96fc8c1c4c3077552a6
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 07:50:24 2019 +0000

    selftest: Create instructions for generating skip file entries
   =20
    create_smb1_fail_skipfile.txt provides both
      + instructions
      + patch to perform the pre-requisite steps to be able to
        modify the environment and parse test output
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit adba4165a5671b8f711ff41b2fe8191b33756734
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 20 12:49:08 2019 +0000

    selftest/knownfail.d: samba3.blackbox.smbclient_basic.NT1.smbclient
   =20
    Add known fail for samba3.blackbox.smbclient_basic.NT1.smbclient
    which fails against nt4_schannel (because it doesn't support
    SMB1)
   =20
    Additionally since we don't have plans to create a nt4_schannel_smb1
    test env provide additional coverage by running this test against
    nt4_dc_smb1 (which still support SMB1)
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e7b4b349069b34fee920f83740fa2863320829b6
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 19 18:39:09 2019 +0000

    selftest/knownfail.d: Add samba4.blackbox.smbclient
   =20
    This test fails for admember & chgdcpass test envs because they
    don't support SMB1
   =20
    Note: There is some coverage for this test with other test envs e.g.
          s4member, ad_dc_ntvfs & others
   =20
    Additionally IIUC this test seems to be for testing smbclient4
    (if this assumption is incorrect then we could substitute with
    smbclient(s3)) However, for the moment it seems best to disable this
    test as smbclient4 doesn't support SMB1 and we have sufficient coverage
    with other SMB1 supporting envs
   =20
    Also remove associated entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 84ba205d1dfeffa74e754b9f819feed926e7542b
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 19 18:37:28 2019 +0000

    selftest/knownfail.d: Add samba4.smb.signing disabled
   =20
    Add know fail for these tests that run against ad_member
    which won't succeed because SMB1 isn't supported
   =20
    However we do have some coverage with s4member (which depends on
    ad_dc_ntvfs) which still supports SMB1.
   =20
    Additionally remove the associated entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit eafdbba6e1fb6e64d61946e3d00e61524612424b
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 19 18:10:02 2019 +0000

    selftest/knownfail.d: Add entries for samba3.unix.whoami
   =20
    samba3.unix.whoami depends of posix extensions which
    currently only work with SMB1. These tests fail with
    environments nt4_member & ad_member. We currently don't
    have plans to provide '_smb1' variants of these environments.
   =20
    So in addition to adding the knownfail we add some
    coverage by running this test with test env ad_dc_smb1.
   =20
    Also we remove the associated entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 0721eed9727462e7e7cdbb0ffcb2ed56378f422f
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 19 16:39:00 2019 +0000

    selftest/knownfail.d: Add samba3.blackbox.smbclient_s3.NT1
   =20
    samba3.blackbox.smbclient_s3.NT1.plain &
    samba3.blackbox.smbclient_s3.NT1.sign tests will fail running against
    test envs ad_member & nt4_member (because those envs don't support SMB1)
   =20
    However we do have some coverage with nt4_dc_smb1_done
   =20
    We could maybe just delete these tests for those environments for
    the moment just create specific knownfail entries and remove associated
    entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit ecaaef4ff7ecefbeec58b814c674831cf408a30d
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 19 17:43:10 2019 +0000

    selftest/knownfail.d knownfail samba3.blackbox.smbclient_auth.plain
   =20
    samba3.blackbox.smbclient_auth.plain will fail against
    ad_member & nt4_member (because these envs don't
    support SMB1) so we don't run these tests where either
    'LANMAN2' or 'NT1' are in the options, in these cases
    to get coverage so we use nt4_dc_smb1
   =20
    Creating new envs for such a small amount of strictly SMB1 tests anyway
    seems overkill. For the moment just create specific knownfail entries
    and remove the associated entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 6d67a89a88c14a67f290bfca3d99ba9c84ed45c7
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 19 15:55:22 2019 +0000

    selftest/knownfail.d Add samba3.blackbox.smbclient_ntlm.plain (NT1)
   =20
    NT1 flavour of samba3.blackbox.smbclient_ntlm.plain tests will
    fail against ad_member, maptoguest, fl2000dc & nt4_member
    (because these envs don't support SMB1)
   =20
    We do however have some coverage with test envs
    nt4_dc_smb1_done & ad_dc_ntvfs.
   =20
    We could maybe just delete these tests for these environments,
    creating new envs for such a small amount of strictly SMB1 tests anyway
    seem overkill. For the moment just create specific knownfail entries
   =20
    associated entries from skip_smb1_fail have also been deleted
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 046396048825b2b0b6f6007341c9afb8b2aef6c0
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 18:08:47 2019 +0000

    s4/selftest: Move samba4.rpc.join tests to ad_dc_default_smb1
   =20
    The following tests which fail when run against a test env that
    doesn't support SMB1
   =20
    samba4.rpc.join on ncacn_ip_tcp with bigendian(ad_dc_default)
    samba4.rpc.join on ncacn_ip_tcp with seal,padcheck(ad_dc_default)
    samba4.rpc.join on ncacn_ip_tcp with validate(ad_dc_default)
    samba4.rpc.join on ncacn_np with bigendian(ad_dc_default)
    samba4.rpc.join on ncacn_np with seal,padcheck(ad_dc_default)
    samba4.rpc.join on ncacn_np with validate(ad_dc_default)
    samba4.rpc.join on ncalrpc with bigendian(ad_dc_default:local)
    samba4.rpc.join on ncalrpc with seal,padcheck(ad_dc_default:local)
    samba4.rpc.join on ncalrpc with validate(ad_dc_default:local)
   =20
    have been moved to ad_dc_default_smb1
   =20
    results verified with
   =20
    VALIDATE=3D"validate" python3 source4/selftest/tests.py | grep "^samba4=
=2Erpc.join" | grep ad_dc_default | sort
   =20
    corrosponding entries have been removed from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e362ad23ee61541c88d2733b91379d995ca900c9
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 17:43:58 2019 +0000

    s4/selftest: Move samba4.ldap.passwordsettings to ad_dc_default_smb1
   =20
    Test samba4.ldap.passwordsettings fails when run against test env that
    doesn't support SMB1 so move to ad_dc_default_smb1
   =20
    Note: no skip entries to be removed as tests are known failures
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 15536417247d2931782e55412f6579afe0289a55
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 17:42:54 2019 +0000

    s4/selftest: Move samba4.ldap.nested-search to ad_dc_default_smb1
   =20
    Test samba4.ldap.nested-search fails when run against test env
    that doesn't support SMB1 so move to ad_dc_default_smb1
   =20
    Also remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit c83fafacbb60b5a09a74b9c16eb9878b85872fc2
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 17:08:35 2019 +0000

    s4/selftest: Modify samba4.blackbox.chgdcpass to use smbclient(s3)
   =20
    Test was using smbclient4 but this fails when used in environments that
    don't support SMB1. We use smbclient(s3) instead. There remains one
    failure due to behaviour differences between the smbclients.
   =20
    The behavioural changes are related not to SMB1/SMB2 but
    commits d4ea637eb869e0c3540140b7ae04c2b483f7693c &
    fce66b22ea312abb252fb9dc748b3adc6fbab49f
   =20
    Perhaps we need to modify s3 smbclient in a similar way? This is however
    something that deserves further discussion.
   =20
    Move this failing part to a knownfail for the moment.
   =20
    Also the corrosponding entry in skip_smb1_fail has been removed
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 89476feec1ccb59c0dd61019afaf23ed0a9affb1
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 16:51:22 2019 +0000

    s3/selftest: Move samba3.smbtorture_s3.vfs_aio* to fileserver_smb1
   =20
    move all failing tests to fileserver_smb1 (exception is the SMB2-BASIC
    test) doesn't need to move
    Additionally remove the associated entries from skip_smb1_file
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 58623e53485f398f5c102b21839ea66979a09992
Author: Noel Power <noel.power@suse.com>
Date:   Tue Jan 7 10:55:19 2020 +0000

    selftest: Modify fileserver_smb1 with vfs_aio params
   =20
    To support running tests samba3.smbtorture_s3.vfs_aio* in
    test env fileserver_smb1 we need to add some params to
    fileserver_smb1 config files.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 07ccb8c70bb5490f953ab6cf2f088141a26e54b3
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 16:26:04 2019 +0000

    s3/selftest: Move samba3.smbtorture_s3.hidenewfiles to fileserver_smb1
   =20
    Test samba3.smbtorture_s3.hidenewfiles fails when run against test
    environments that don't support SMB1. Move this test to fileserver_smb1
    and remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f7456c8be9c49a839e42c6692b5a35fecf8d1634
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 16:20:07 2019 +0000

    selftest: Add 'hide new files timeout' related data to fileserver_smb1
   =20
    In order to support samba3.smbtorture_s3.hidenewfiles (and moving
    the test to fileserver_smb1) we need to ensure we have some supporting
    config
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 9161cf7495c8415d919a580174fab58a0bfda0e4
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 16:07:34 2019 +0000

    s3/selftest: Move tests raw.samba3hide, raw.samba3checkfsp & raw.samba3=
closeerr
   =20
    Move tests raw.samba3hide, raw.samba3checkfsp & raw.samba3closeerr from
    ad_dc to ad_dc_smb1. Also update flapping and knownfail entries to cater
    for the new env.
   =20
    no entries in skip files to be removed as flapping & knownfail negate
    the need for this.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 2b1cca4c51443797d63d9af8000bd58901cc34cf
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 16:01:33 2019 +0000

    s3/selftest: Move tests raw.samba3hide, raw.samba3checkfsp & raw.samba3=
closeerr
   =20
    Move tests raw.samba3hide, raw.samba3checkfsp & raw.samba3closeerr from
    simpleserver to fileserver. Also need a knownfail for raw.samba3closeerr
    which fails in envs that NT ACLs enabled. We will get extra coverage
    from ad_dc_smb1 when the same tests are moved there.
   =20
    Remove the associated entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 65aa21b8e7de636347bf645eb581b779c9add76f
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 18:27:25 2019 +0000

    s3/selftest Move samba3.smbtorture_s3.plain.RENAME-ACCESS to nt4_dc_smb1
   =20
    Also remove associated entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit aa688a8de6990042cf489004a2dfa6382606469c
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 14:17:02 2019 +0000

    s4/selftest: Move samba.tests.libsmb to nt4_dc_smb1
   =20
    Also remove associated entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 628ff67b72385c31d6310bfa7547a8f151f6d2fb
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 14:15:51 2019 +0000

    s3/selftest: Move samba3.unix.whoami to nt4_dc_smb1
   =20
    Also remove the associated entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 6820a8cd9a39a637ed5bb04bb90ca474fe5be313
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 14:15:12 2019 +0000

    s3/selftest Move samba3.smbtorture_s3.plain.MANGLE-ILLEGAL to ad_dc_smb1
   =20
    Also remove the associated entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 2668459b90b884fa94faa6068b034fef225b625a
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 14:10:50 2019 +0000

    s3/selftest: Move samba3.smbtorture_s3.plain.POSIX* to nt4_dc_smb1
   =20
        The tests menioned below all fail when run against environments that
        don't support SMB1 so we move them to nt4_dc_smb1
   =20
        python3 source3/selftest/tests.py | grep "^samba3.smbtorture_s3.cry=
pt\." | grep nt4_dc_smb1 | cut -f1 -d\( | sort -u
   =20
        samba3.smbtorture_s3.plain.POSIX
        samba3.smbtorture_s3.plain.POSIX-ACL-OPLOCK
        samba3.smbtorture_s3.plain.POSIX-ACL-SHAREROOT
        samba3.smbtorture_s3.plain.POSIX-APPEND
        samba3.smbtorture_s3.plain.POSIX-BLOCKING-LOCK
        samba3.smbtorture_s3.plain.POSIX-MKDIR
        samba3.smbtorture_s3.plain.POSIX-OFD-LOCK
        samba3.smbtorture_s3.plain.POSIX-STREAM-DELETE
        samba3.smbtorture_s3.plain.POSIX-SYMLINK-ACL
        samba3.smbtorture_s3.plain.POSIX-SYMLINK-EA
        samba3.smbtorture_s3.plain.WINDOWS-BAD-SYMLINK (this is a posix
    test)
   =20
    Also remove entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 63784fd6ef83c85b82723b6f9aa40786c6c31e56
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 14:07:54 2019 +0000

    s3/selftest: Move samba3.smbtorture_s3.crypt.POSIX* to nt4_dc_smb1
   =20
    The tests menioned below all fail when run against environments that
    don't support SMB1 so we move them to nt4_dc_smb1
   =20
    python3 source3/selftest/tests.py | grep "^samba3.smbtorture_s3.crypt\.=
" | grep nt4_dc_smb1 | cut -f1 -d\( | sort -u
   =20
    samba3.smbtorture_s3.crypt.POSIX
    samba3.smbtorture_s3.crypt.POSIX-ACL-OPLOCK
    samba3.smbtorture_s3.crypt.POSIX-ACL-SHAREROOT
    samba3.smbtorture_s3.crypt.POSIX-APPEND
    samba3.smbtorture_s3.crypt.POSIX-BLOCKING-LOCK
    samba3.smbtorture_s3.crypt.POSIX-MKDIR
    samba3.smbtorture_s3.crypt.POSIX-OFD-LOCK
    samba3.smbtorture_s3.crypt.POSIX-STREAM-DELETE
    samba3.smbtorture_s3.crypt.POSIX-SYMLINK-ACL
    samba3.smbtorture_s3.crypt.POSIX-SYMLINK-EA
    samba3.smbtorture_s3.crypt.WINDOWS-BAD-SYMLINK (this is a posix test)
   =20
    also remove these entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit a78f7478673c3f33b609b7561d1964e7923159fc
Author: Noel Power <noel.power@suse.com>
Date:   Tue Mar 3 17:25:30 2020 +0000

    s3/selftest: Move samba3.smbtorture_s3.crypt_server.TORTURE to nt4_dc_s=
mb1
   =20
    Test fails to negotiation SMB1 in environments that require SMB1 so
    move to nt4_dc_smb1 env.
   =20
    entry also removed from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit a20ad8674bc3d69e8378bd89f78516880f243e34
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 13:43:32 2019 +0000

    s3/selftest: Move samba3.smbtorture_s3.crypt_client.* to nt4_dc_smb1
   =20
    Move samba3.smbtorture_s3.crypt_client.* tests which fail against
    environments that don't support SMB1.
   =20
    The following tests have been moved from nt4_dc -> nt4_dc_smb1
   =20
    samba3.smbtorture_s3.crypt_client.ATTR
    samba3.smbtorture_s3.crypt_client.BROWSE
    samba3.smbtorture_s3.crypt_client.CASE-INSENSITIVE-CREATE
    samba3.smbtorture_s3.crypt_client.CHAIN1
    samba3.smbtorture_s3.crypt_client.CHAIN2
    samba3.smbtorture_s3.crypt_client.CHAIN3
    samba3.smbtorture_s3.crypt_client.CHKPATH
    samba3.smbtorture_s3.crypt_client.CLEANUP1
    samba3.smbtorture_s3.crypt_client.CLEANUP2
    samba3.smbtorture_s3.crypt_client.CLEANUP4
    samba3.smbtorture_s3.crypt_client.CLI_SPLICE
    samba3.smbtorture_s3.crypt_client.DELETE
    samba3.smbtorture_s3.crypt_client.DELETE-LN
    samba3.smbtorture_s3.crypt_client.DELETE-STREAM
    samba3.smbtorture_s3.crypt_client.DIR
    samba3.smbtorture_s3.crypt_client.DIR-CREATETIME
    samba3.smbtorture_s3.crypt_client.FDPASS
    samba3.smbtorture_s3.crypt_client.FDSESS
    samba3.smbtorture_s3.crypt_client.IOCTL
    samba3.smbtorture_s3.crypt_client.LARGE_READX
    samba3.smbtorture_s3.crypt_client.LOCK1
    samba3.smbtorture_s3.crypt_client.LOCK10
    samba3.smbtorture_s3.crypt_client.LOCK11
    samba3.smbtorture_s3.crypt_client.LOCK13
    samba3.smbtorture_s3.crypt_client.LOCK2
    samba3.smbtorture_s3.crypt_client.LOCK3
    samba3.smbtorture_s3.crypt_client.LOCK4
    samba3.smbtorture_s3.crypt_client.LOCK5
    samba3.smbtorture_s3.crypt_client.LOCK6
    samba3.smbtorture_s3.crypt_client.LOCK7
    samba3.smbtorture_s3.crypt_client.LOCK9A
    samba3.smbtorture_s3.crypt_client.LOCK9B
    samba3.smbtorture_s3.crypt_client.NTTRANS-FSCTL
    samba3.smbtorture_s3.crypt_client.OPEN
    samba3.smbtorture_s3.crypt_client.OPLOCK1
    samba3.smbtorture_s3.crypt_client.OPLOCK2
    samba3.smbtorture_s3.crypt_client.OWNER-RIGHTS
    samba3.smbtorture_s3.crypt_client.PIDHIGH
    samba3.smbtorture_s3.crypt_client.PROPERTIES
    samba3.smbtorture_s3.crypt_client.RENAME
    samba3.smbtorture_s3.crypt_client.RENAME-ACCESS
    samba3.smbtorture_s3.crypt_client.RW1
    samba3.smbtorture_s3.crypt_client.RW2
    samba3.smbtorture_s3.crypt_client.RW3
    samba3.smbtorture_s3.crypt_client.RW-SIGNING
    samba3.smbtorture_s3.crypt_client.SHORTNAME-TEST
    samba3.smbtorture_s3.crypt_client.STREAMERROR
    samba3.smbtorture_s3.crypt_client.TCON
    samba3.smbtorture_s3.crypt_client.TCON2
    samba3.smbtorture_s3.crypt_client.TCONDEV
    samba3.smbtorture_s3.crypt_client.TORTURE
    samba3.smbtorture_s3.crypt_client.TRANS2
    samba3.smbtorture_s3.crypt_client.UID-REGRESSION-TEST
    samba3.smbtorture_s3.crypt_client.UNLINK
    samba3.smbtorture_s3.crypt_client.W2K
    samba3.smbtorture_s3.crypt_client.WILDDELETE
    samba3.smbtorture_s3.crypt_client.XCOPY
   =20
    and have been removed from skip_smb1_fail
   =20
    list of tests modified has been verified with
   =20
    python3 source3/selftest/tests.py | grep "^samba3.smbtorture_s3." | gre=
p nt4_dc_smb1 | cut -f1 -d\( | sort -u
   =20
    addionally any knownfail entries have been updated as appropriate.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit b527816cc9d428596c4efa0a746900be323eab9e
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 13:32:22 2019 +0000

    s3/selftest: Move rpc.samba3.netlogon & rpc.samba3.sessionkey to nt4_dc=
_smb1
   =20
    Move test samba3.rpc.samba3.netlogon & ^samba3.rpc.samba3.sessionkey
    to nt4_dc_smb1 as these tests will fail when run against an environment
    that doesn't support SMB1 and remove the entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit a762e8c6739492e9405c94d9b623f6d2d90b3854
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 13:21:13 2019 +0000

    s3/selftest: Move samba3.rpc.lsa.lookupsids to nt4_dc_smb1
   =20
    Test samba3.rpc.lsa.lookupsids when run with protocol options specifying
    smb1 will of course fail when run against environments the don't support
    SMB1 so move such tests to nt4_dc_smb1
   =20
    Additionally remove those entries from the skip file as porting is
    not needed.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 29c340bcafff5569ec79179940e50ea511ca6bb2
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:39:48 2019 +0000

    s3/selftest: Move samba3.raw.session to nt4_dc_smb1
   =20
    Move test samba3.raw.session which fails in test environments that
    don't support SMB1 to nt4_dc_smb1 and remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 3a9e6782bf8173a00d148ed8b6d08f267edc6108
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:32:09 2019 +0000

    s3/selftest: Move samba3.raw.search to nt4_dc_smb1
   =20
    Test samba3.raw.search fails in test environments that don't
    support SMB1 so move test to nt4_dc_smb1 and remove entry from
    skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 9fa646177091de77313a43e4effdd8dba039652e
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 12:54:11 2019 +0000

    s3/selftest: Move samba3.raw.samba3posixtimedlock to nt4_dc_smb1
   =20
    Test samba3.raw.samba3posixtimedlock will not succeed in test
    environments that don't support SMB1 so we move it to nt4_dc_smb1
    and remove associated entries from skip_smb1_selftest
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit fce023d649f0f87a2c9a62b1ade482878c0a6fb2
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 12:51:25 2019 +0000

    s3/selftest: Move samba3.raw.samba3posixtimedlock to ad_dc_smb1
   =20
    Test samba3.raw.samba3posixtimedlock will not succeed in test
    environments that don't support SMB1 so we move it to ad_dc_smb1
    and also remove associated entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 3fd9c4ac092050caa6bf82a8e8f5111bc26a5173
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 12:48:39 2019 +0000

    s3/selftest: Prep commit split handling for raw.samba3posixtimedlock
   =20
    raw.samba3posixtimedlock & smb2.samba3misc share the same logic block
    but in a future commit we will need to split these tests into
    '_smb1' & non '_smb1' environments
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 9fab393a9c3047c2c35e8c56b1d6a5e0af541cf2
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:22:05 2019 +0000

    s3/selftest: Move raw.samba3checkfsp, raw.samba3hide & raw.samba3closee=
rr
   =20
    Tests samba3.raw.samba3checkfsp, samba3.raw.samba3hide &
    samba3.raw.samba3closeerr fail in test environments that don't support
    SMB1 so move to nt4_dc_smb1. Additionally samba3.raw.samba3closeer was
    a known fail in nt4_dc so this also needs to be adjusted for the new
    env.
   =20
    Remove the remaining entries from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 4d9506deae8a70db8551b66c311590383d676792
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:19:38 2019 +0000

    s3/selftest Move samba.raw.read to nt4_dc_smb1
   =20
    Move test samba.raw.read which fails in test environments that
    don't support SMB1 to nt4_dc_smb1 and remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e4bdeabf1d464accba105296dc08e35b79de2b87
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:18:03 2019 +0000

    s3/selftest: Move samba3.raw.notify & samba3.raw.oplock to nt4_dc_smb1
   =20
    Move samba3.raw.notify & samba3.raw.oplock which fail when used with
    test environments that don't support SMB1 to nt4_dc_smb1 and remove
    associated entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit be21c8b76a3acf961749b9ed4c78ef8c36d3b2c3
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:14:17 2019 +0000

    s3/selftest: Use variable for test env rather than hardcoding
   =20
    This change makes it easier and clearer in following commits
    to make specific changes based on test name.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f35120b028699a4d43e78444a094607f4ed1f00b
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:10:29 2019 +0000

    s3/selftest: Move samba3.raw.chkpath to nt4_dc_smb1
   =20
    Move samba3.raw.chkpath which fails in environments that don't
    support SMB1 to nt4_dc_smb1 and remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit c9b13ca09fcd3461be8bd775170f03fbfa3b8ea7
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 12:01:49 2019 +0000

    s3/selftest: Move samba3.raw.acls* to nt4_dc_smb1
   =20
    Tests samba3.raw.acls* don't succeed in environments that don't
    support SMB1 so move them to nt4_dc_smb1
   =20
    Also need to adjust knownfail for samba3.raw.acls nfs4acl_xattr*
    Additionally remove the entries for test from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 718fea5cd8ce6e8a1de363ccabed26b24a5fbbe3
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 11:57:40 2019 +0000

    s3/selftest: Move samba3.blackbox.smbclient_s3.NT1.sign to nt4_dc_smb1
   =20
    samba3.blackbox.smbclient_s3.NT1.sign as the name suggests will fail
    in test envs that do not support SMB1 so move it to a _smb1
    environment.
   =20
    Additionally the associated skip_smb1_fails entry is removed as the
    test doesn't need to be ported
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit bcca2563416c0792ccad513872690a8cd86be49a
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 11:49:16 2019 +0000

    s3/selftest: Remove unnecssary for loop
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 227095bb790345d455f3104001ccf15f2e3ae6f0
Author: Noel Power <noel.power@suse.com>
Date:   Fri Apr 3 14:14:58 2020 +0100

    s3/selftest: Move samba3.blackbox.smbclient_ntlm.plain to nt4_dc_smb1
   =20
    samba3.blackbox.smbclient_ntlm.plain will fail in test environment
    that doesn't support SMB1 so move to nt4_dc_smb1
   =20
    This test only fails with options that require it to communicate over
    SMB1, there are sibling tests that test against >=3D SMB2 so also we
    remove the skip_smb1_fail entry as this test doen't need porting
    (for this env)
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e848ad1232ce88840c9aa692d49b454b9a389682
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 11:39:52 2019 +0000

    s3/selftest: Move samba3.rap.sam to nt4_dc_smb1
   =20
    This tests fails against nt4_dc because it doesn't support SMB1 so
    we move it to nt4_dc_smb1 and remove the corrosponding entry from
    skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 18ffea5e8950c8f823f6e357521d2871c55708ab
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 11:34:13 2019 +0000

    s3/selftest: Move samba3.blackbox.smbclient_large_file*NT1 to nt4_dc_sm=
b1
   =20
    Test samba3.blackbox.smbclient_large_file*NT1 will only succeed against
    test environments that support SMB1 so we move it to nt4_dc_smb1.
   =20
    Additionally remove the entry from the skip_smb1_faill file
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f9b1ef8eff1402b9614f69adfb3b51ebfc00a33f
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 11:28:06 2019 +0000

    s3/selftest: Move samba3.blackbox.smbclient_s3.NT1.plain to nt4_dc_smb1
   =20
    Test samba3.blackbox.smbclient_s3.NT1.plain as its name suggests
    requires a test environment that supports SMB1 so we move it to one.
    Additionally the entry from the skip_smb1_fail file is removed (for this
    env) as not porting is required.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit da0dc866b3702ea1ab8ec5c6760de196de8f7137
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 11:04:51 2019 +0000

    s3/selftest: Remove unnecessary for loop
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 691ef77fe8824fd620d04629ff0b3589dac0c454
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 10:49:51 2019 +0000

    s3/selftest: Move samba3.blackbox.smbclient_s3.NT1.crypt to nt4_dc_smb1
   =20
    now that a specific SMB1 enabled env is available lets move this
    test to nt4_dc_smb1 env. Additionally the entry is removed from
    skip_smb1_fails as no porting is required
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit c8ddcc822a8974add967b55b08aa8d92547c17a3
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 10:44:51 2019 +0000

    s3/selftest: Remove unnecessary 'for' loop
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 0c88b2b1f85087a1dcaede201ed0986df4347a97
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 10:28:40 2019 +0000

    s3/selftest: Move samba3.blackbox.smbclient_auth.plain to _smb1_done
   =20
    samba3.blackbox.smbclient_auth.plain will fail in test environment
    that doesn't support SMB1 so move to directly to test env
    nt4_dc_smb1_done as it doesn't require porting.
   =20
    This test only fails with options that require it to communicate over
    SMB1, there are sibling tests that test against >=3D SMB2 so also we
    remove the skip_smb1_fail entry as this test doen't need porting
    (for this env)
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit dd7218371a2faaee2e64d125d3a93ab2053cf571
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 10:26:59 2019 +0000

    s3/selftest: Move samba3.base.rw1 to nt4_dc_smb1
   =20
    Test samba3.base.rw1 only works in test environments that support
    SMB1 so move test to nt4_dc_smb1 and remove the entry from
    skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit b05f34769552d469450c973219fb443ff881057e
Author: Noel Power <noel.power@suse.com>
Date:   Tue Jan 7 10:32:33 2020 +0000

    s3/selftest: Move samba3.raw.lock & samba3.base.lock to nt4_dc_smb1
   =20
    samba3.raw.lock & samba3.raw.lock currently will only work in
    environments that negotiate SMB1 so lets move them to new nt4_dc_smb1
    and remove those entries form skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 572bc3e643c53ef5d95d9116d0aeac72f7ec2b5b
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 12 14:48:54 2019 +0000

    s4/selftest: Adjust samba4.blackbox.pkinit to use (s3) smbclient
   =20
    samba4.blackbox.pkinit falls to pass in environments that don't support
    SMB2 because of use (s4) smbclient4. Change test to use (s3) smbclient
   =20
    Additionally a test within the test script test_kinit_trusts_heimdal.sh
    explicitly uses smbclient4 which can't negotiate SMB1 in environments
    that don't support it. Add knownfail to cater for this & also remove en=
try
    from the skip file
   =20
    Further reference the smbclient4 specific test is associated with
    https://bugzilla.samba.org/show_bug.cgi?id=3D12554 so maybe we should
    keep it for the moment
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 4c92489383122ee4429d341a82cfb43ce6f9b4d3
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 12 11:27:18 2019 +0000

    s4/selftest: Move samba.tests.net_join_no_spnego to ad_dc_smb1
   =20
    Test samba.tests.net_join_no_spnego when run in environment
    doesn't support SMB1 so move it to ad_dc_smb1 and remove
    skip_smb1_fail entry
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 6edb46682dffed8f0ffae9317a3d06fc27dd5616
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 12 11:23:54 2019 +0000

    s4/selftest: Move samba.tests.auth_log_pass_change to ad_dc_smb1
   =20
    Test samba.tests.auth_log_pass_change  will fail when run against
    environments that don't support SMB1 so move this test to ad_dc_smb1
    and remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit fc1121bc6ba65e15e90e9836e491b54046bbe800
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 12 11:22:35 2019 +0000

    s4/selftest: Move samba.tests.auth_log to ad_dc_smb1
   =20
    Test samba.tests.auth_log will fail when run against environments that
    don't support SMB1 so move this test to ad_dc_smb1 and removing
    entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 53532fed6411d705d0882061b300cbf996ca1d63
Author: Noel Power <noel.power@suse.com>
Date:   Tue Jan 7 10:28:39 2020 +0000

    s3/selftest: Move samba3.blackbox.smbclient_ntlm.plain NT1 to _smb1_done
   =20
    samba3.blackbox.smbclient_ntlm.plain NT1 fails in environments that
    don't support SMB2 so we need to move it to the appropriate _smb1
    test env and since this test doesn't need to be ported we can actually
    move it directly to the _smb1_done env to indicate that.
   =20
    Also remove the samba3.blackbox.smbclient_ntlm.plain NT1(ad_dc)
    entry from the skip file because we have moved this to the ad_dc_smb1
    *and* this test is already ported to >=3DSMB2
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit a166ddc740a58f42c874d56240283bc644764617
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 13:02:25 2019 +0000

    s4/selftest: Move samba4.smb.spnego to ad_dc_smb1
   =20
    Moving
   =20
    samba4.smb.spnego.krb5.no_optimistic(ad_dc)
    samba4.smb.spnego.ntlmssp.no_optimistic(ad_dc)
   =20
    and additionally removing the entries from skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit ed3b15b33c3b25ef491b495c9a70fca65d4f69d0
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 12:53:24 2019 +0000

    s4/selftest: Move samba4.rpc.join tests from ad_dc to ad_dc_smb1
   =20
    Move the following tests from ad_dc to ad_dc_smb1
   =20
    samba4.rpc.join with bigendian(ad_dc)
    samba4.rpc.join with seal,padcheck(ad_dc)
    samba4.rpc.join with validate(ad_dc)
   =20
    and additionally remove the corrosponding entries from skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit b056425340281604ae6e62786a209bf16efddebb
Author: Noel Power <noel.power@suse.com>
Date:   Tue Mar 3 17:24:36 2020 +0000

    s4/selftest: Move failing samba4.rpc.authcontext.* (ad_dc) to ad_dc_smb1
   =20
    Move
    samba4.rpc.authcontext with bigendian(ad_dc)
    samba4.rpc.authcontext with seal,padcheck(ad_dc)
    samba4.rpc.authcontext with validate(ad_dc)
   =20
    to ad_dc_smb1 environment and remove the corrosponding entries in
    skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 1c8974b421c370257612ef2cd3359b31f97b0737
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 12:33:04 2019 +0000

    s4/selftest: run samba4.libsmbclient.*.NT1.* tests in ad_dc_smb1
   =20
    additionally remove those related entries from skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 0aa44c88d219ac57e67e459c66ae0f165eecdc7b
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 12:28:05 2019 +0000

    s4/selftest: move samba4.dfs.domain to ad_dc_smb1
   =20
    Additionally remove the test entry from skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 3b4e7dbd090e8d548f66d315b97f4f62f1596982
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:48:38 2019 +0000

    s3/selftest: Move samba3.rpc.samba3.netlogon to ad_dc_smb1
   =20
    Move test samba3.rpc.samba3.netlogon which fails in enviroments that
    don't support SMB1 to ad_dc_smb1 and remove the test entry from
    skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 83f1a9a2505ecc30d70d130b56685397338b9549
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:46:36 2019 +0000

    s3/selftest: Move samba3.raw.search to ad_dc_smb1 environments
   =20
    Test samba3.raw.search fails in envrionments that don't support SMB1
    so we move it to ad_dc_smb1 and also remove the entry in skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 543553fe148ac5b52ab88be3c31e0e5fbafb8b3f
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:45:33 2019 +0000

    s3/selftest: Move samba3.raw.read to ad_dc_smb1
   =20
    Test samba3.raw.read fails in environments that don't support SMB1
    so move it to ad_dc_smb1 and also remove the entry in skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 59eb2724891c6132914231e1a027c59c1f9ac43d
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:44:00 2019 +0000

    s3/selftest: Move samba3.raw.acls to ad_dc_smb1 env
   =20
    Test samba3.raw.acls fails in environments that don't support SMB1
    so move it to ad_dc_smb1 and remove the entry in skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 8bce1a1bf5b73ebc0a1cf8088e7b994dd512f93b
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:42:24 2019 +0000

    s3/selftest: Move samba3.base.rw1 to environment ad_dc_smb1
   =20
    Test samba3.base.rw1 fails in environments that don't support
    SMB1 so we move it to ad_dc_smb1 and also remove the entry in
    skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e71c2753136f38464605c3bc476bcb65c892288d
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:40:23 2019 +0000

    s3/selftest: Move samba3.raw.session* to ad_dc_smb1
   =20
    The following tests which fail when used with environments that don't
    support SMB1 fail so we move them to ad_dc_smb1 instead and also remove
    th entry in skip_smb1_fails
   =20
    samba3.raw.session ntlm
    samba3.raw.session krb5
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 53c3612da02943dde320d6ac842f8d40d27cc57f
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:37:09 2019 +0000

    s3/selftest: Move samba3.raw.chkpath to ad_dc_smb1
   =20
    Test samba3.raw.chkpath fails in environments that don't support SMB1
    so we move it to ad_dc_smb1 and also remove the entry from skip_smb1_fa=
ils
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 9f152ae85eafc33301e39d355a554b072beeed65
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:35:10 2019 +0000

    s3/selftest: Move samba3.unix.whoami* tests to ad_dc_smb1
   =20
    The following tests which fail in environments that dont support
    SMB1 have been moved to ad_dc_smb1
   =20
    samba3.unix.whoami
    samba3.unix.whoami kerberos connection
    samba3.unix.whoami anonymous connection
    samba3.unix.whoami ntlm user@realm
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 8ab2c60305d85518c55cb4872709521cf374fae7
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:32:29 2019 +0000

    s3/sefltest: Move samba3.rap.sam to ad_dc_smb1 environment
   =20
    Test samba3.rap.sam fails in environments that don't support
    SMB1 so we move it to enironment ad_dc_smb1 and remove the entry in
    skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit fbd63bad461e765d91d62b3344edd62881593d74
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:30:54 2019 +0000

    s3/selftest: Move samba3.base.createx_access to ad_dc_smb1 env
   =20
    Test samba3.base.createx_access fails in environments that dont
    support SMB1, moving this test to ad_dc_smb1 and removing the entry
    in skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 90a493acdf3303c0a18835ecc8abb2f1f136bf74
Author: Noel Power <noel.power@suse.com>
Date:   Tue Jan 7 10:27:12 2020 +0000

    s3/selftest: Move various samba3.raw tests to _smb1 env
   =20
    The following tests which fail when used in environment that
    SMB1 cannot be negotiated in have been moved to ad_dc_smb1
    & nt4_dc_smb1
   =20
    samba3.raw.close(ad_dc_smb1)
    samba3.raw.composite(ad_dc_smb1)
    samba3.raw.eas(ad_dc_smb1)
    samba3.raw.mkdir(ad_dc_smb1)
    samba3.raw.open(ad_dc_smb1)
    samba3.raw.rename(ad_dc_smb1)
    samba3.raw.samba3badnameblob(ad_dc_smb1)
    samba3.raw.samba3badpath(ad_dc_smb1)
    samba3.raw.samba3caseinsensitive(ad_dc_smb1)
    samba3.raw.samba3oplocklogoff(ad_dc_smb1)
    samba3.raw.samba3rootdirfid(ad_dc_smb1)
    samba3.raw.sfileinfo.bug(ad_dc_smb1)
    samba3.raw.sfileinfo.end-of-file(ad_dc_smb1)
    samba3.raw.sfileinfo.rename(ad_dc_smb1)
    samba3.raw.streams(ad_dc_smb1)
    samba3.raw.unlink(ad_dc_smb1)
    samba3.raw.write(ad_dc_smb1)
   =20
    verified with
       python3 source3/selftest/tests.py  | grep ad_dc_smb1 | grep "^samba3=
=2Eraw" | sort -u
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f7329c0dcf65ad649d76aa33cd6c03b6d7c4bf74
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:16:46 2019 +0000

    s3/selftest: Move various samba3.rpc.* tests to ad_dc_smb1
   =20
    The following tests which fail in environments that cannot negotiate
    SMB1 have been moved to ad_dc_smb1 & nt4_dc_smb1
   =20
    samba3.rpc.authcontext
    samba3.rpc.join
    samba3.rpc.samba3.bind
    samba3.rpc.samba3.getusername
    samba3.rpc.samba3.sharesec
    samba3.rpc.samba3.smb1-pipe-name
    samba3.rpc.samba3.smb-reauth1
    samba3.rpc.samba3.smb-reauth2
    samba3.rpc.samba3.spoolss
    samba3.rpc.samba3.wkssvc
   =20
    python3 source3/selftest/tests.py  | grep ad_dc_smb1 | grep "^samba3.rp=
c" | sort -u
   =20
    test entries have also been removed from skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 1368124731eddaa48a66bbf9059a5749b8ce5101
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:09:02 2019 +0000

    s3/selftest: Move samba3.unix.info2 to ad_dc_smb1 & nt4_dc_smb1
   =20
    verified with
   =20
      python3 source3/selftest/tests.py  | grep _smb1 | grep "^samba3.unix"=
 | sort -u
   =20
    Additionally the test entries in skip_smb1_fail also removed
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 25efadd5f36b9d8b01b22c1613ba0b9afeff5e18
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 18:06:47 2019 +0000

    s3/selftest: Move samba3.rap.basic & samba3.rap.rpc to _smb1 env
   =20
    Tests:
      samba3.rap.basic
      samba3.rap.rpc
   =20
    have been moved to ad_dc_smb1, nt4_dc_smb1
   =20
    verified by
      python3 source3/selftest/tests.py  | grep ad_dc_smb1 | grep "^samba3.=
rap"
   =20
    these tests have been removed from skip_smb1_fails
    Additionally
    samba3.rap.basic.netsessiongetinfo was already marked as knownfail
    in ad_dc so in ad_dc_smb1 also true
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e16aba83fc5da9d0a1189e8bbb3b115c7f609742
Author: Noel Power <noel.power@suse.com>
Date:   Wed Mar 4 17:35:40 2020 +0000

    s3/selftest: Move various samba3.base.* tests to _smb1 environment(s)
   =20
    From list of tests identified as failing with environments that
    cannot negotiate SMB2 the following tests have been moved to ad_dc_smb1
    & nt4_dc_smb1 (and additionally removed from skip_smb1_fails)
   =20
    samba3.base.attr
    samba3.base.chkpath
    samba3.base.defer_open
    samba3.base.delete
    samba3.base.deny3
    samba3.base.denydos
    samba3.base.dir1
    samba3.base.dir2
    samba3.base.disconnect
    samba3.base.fdpass
    samba3.base.mangle
    samba3.base.negnowait
    samba3.base.ntdeny1
    samba3.base.ntdeny2
    samba3.base.open
    samba3.base.openattr
    samba3.base.properties
    samba3.base.rename
    samba3.base.samba3error
    samba3.base.secleak
    samba3.base.tcon
    samba3.base.tcondev
    samba3.base.trans2
    samba3.base.unlink
    samba3.base.vuid
    samba3.base.xcopy
   =20
    list of tests verified with
   =20
    python3 source3/selftest/tests.py  | egrep 'ad_dc_smb1|nt4_dc_smb1' | g=
rep "^samba3.base" | sort -u
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 08171c0392648fb43424ab34376bf0bbee28b5aa
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 11 17:24:10 2019 +0000

    s3/selftest: move base.delaywerite, base.deny1 & base.deny2 to _smb1 env
   =20
    the following tests
   =20
    samba3.base.delaywrite
    samba3.base.deny1
    samba3.base.deny2
   =20
    have been moved to fileserver_smb1 env and removed from skip_file
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f3ae2dcec1c776477b3d9301d149c2fe27314991
Author: Noel Power <noel.power@suse.com>
Date:   Tue Mar 3 17:23:04 2020 +0000

    s3/selftest: Move samba3.smbtorture_s3.plain.* tests to fileserver_smb1
   =20
    with the exception of tests containing
      "SMB2", "BAD-NBT-SESSION", "DIR1", "LOCK12", "OPLOCK4"
   =20
    so the following tests have been moved
   =20
    output below from
       python3 source3/selftest/tests.py | grep samba3.smbtorture_s3.plain |
    sort -u
   =20
    samba3.smbtorture_s3.plain.ATTR
    samba3.smbtorture_s3.plain.BROWSE
    samba3.smbtorture_s3.plain.CASE-INSENSITIVE-CREATE
    samba3.smbtorture_s3.plain.CHAIN1
    samba3.smbtorture_s3.plain.CHAIN2(
    samba3.smbtorture_s3.plain.CHAIN3
    samba3.smbtorture_s3.plain.CHKPATH
    samba3.smbtorture_s3.plain.CLEANUP1
    samba3.smbtorture_s3.plain.CLEANUP2
    samba3.smbtorture_s3.plain.CLEANUP4
    samba3.smbtorture_s3.plain.CLI_SPLICE
    samba3.smbtorture_s3.plain.DELETE
    samba3.smbtorture_s3.plain.DELETE-LN
    samba3.smbtorture_s3.plain.DELETE-STREAM
    samba3.smbtorture_s3.plain.DIR-CREATETIME
    samba3.smbtorture_s3.plain.DIR(
    samba3.smbtorture_s3.plain.FDPASS
    samba3.smbtorture_s3.plain.FDSESS
    samba3.smbtorture_s3.plain.IOCTL
    samba3.smbtorture_s3.plain.LARGE_READX
    samba3.smbtorture_s3.plain.LOCK10
    samba3.smbtorture_s3.plain.LOCK11
    samba3.smbtorture_s3.plain.LOCK13
    samba3.smbtorture_s3.plain.LOCK1
    samba3.smbtorture_s3.plain.LOCK2
    samba3.smbtorture_s3.plain.LOCK3
    samba3.smbtorture_s3.plain.LOCK4
    samba3.smbtorture_s3.plain.LOCK5
    samba3.smbtorture_s3.plain.LOCK6
    samba3.smbtorture_s3.plain.LOCK7
    samba3.smbtorture_s3.plain.LOCK9A
    samba3.smbtorture_s3.plain.LOCK9B
    samba3.smbtorture_s3.plain.NTTRANS-FSCTL
    samba3.smbtorture_s3.plain.OPEN
    samba3.smbtorture_s3.plain.OPLOCK1
    samba3.smbtorture_s3.plain.OPLOCK2
    samba3.smbtorture_s3.plain.OPLOCK5
    samba3.smbtorture_s3.plain.OWNER-RIGHTS
    samba3.smbtorture_s3.plain.PIDHIGH
    samba3.smbtorture_s3.plain.RENAME
    samba3.smbtorture_s3.plain.RW1
    samba3.smbtorture_s3.plain.RW2
    samba3.smbtorture_s3.plain.RW3
    samba3.smbtorture_s3.plain.RW-SIGNING
    samba3.smbtorture_s3.plain.SHORTNAME-TEST
    samba3.smbtorture_s3.plain.STREAMERROR
    samba3.smbtorture_s3.plain.TCON2
    samba3.smbtorture_s3.plain.TCONDEV
    samba3.smbtorture_s3.plain.TCON
    samba3.smbtorture_s3.plain.TRANS2
    samba3.smbtorture_s3.plain.UID-REGRESSION-TEST
    samba3.smbtorture_s3.plain.UNLINK
    samba3.smbtorture_s3.plain.W2K
    samba3.smbtorture_s3.plain.WILDDELETE
    samba3.smbtorture_s3.plain.XCOPY
   =20
    corrosponding entries removed from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 422e6c5a795eba65f2298b60b72227817784f3eb
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 19:40:09 2019 +0000

    s4/selftest: adjust samba.blackbox.pdbtest to use (s3) smbclient
   =20
    smbclient4 only negotiates smb1, this test should use smbclient(s3)
    instead.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 7e04d84b5f1e5b0975f4fa0755786ed213739125
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 18:11:41 2019 +0000

    s4/selftest: Adjust samba4.blackbox.samba_tool to use (s3) smbclient
   =20
    (s4) smbclient doesn't negotiate smb2, (s3) smbclient is what
    is used and what we really should be testing.
   =20
    Additionally remove entry from ski_smb1_fails file
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 1c3f954ab484a8476f3fb5d610a9b8b643632c78
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 17:19:34 2019 +0000

    s4/selftest: Use (s3) smbclient for test samba4.blackbox.kinit
   =20
    Additionally we remove the entry from skip_smb1_fails as it is
    no longer relevant
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 3558332228c0120f0f6d1a97efcdda5a9a81a65a
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 11:39:58 2019 +0000

    s4/selftest: Use s3 smbclient for samba4.blackbox.bogusdomain
   =20
    Additionally remove the test from skip_smb1_fails
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 87d77b3ea9fea3766608aa5e2c797e2fa374f60e
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 11:30:00 2019 +0000

    s4/selftest: Add smbclient (s3 version) binary to s4/tests
   =20
    smbclient4 only negotiates smb1, tests probably should use smbclient
    instead (except for tests that intentionally are testing smbclient4
    itself)
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 2b35d8e07b5f91460b1eddff95a414f00ca34874
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 11:12:22 2019 +0000

    s3/selftest: move samba3.blackbox.smbspool to ad_dc_smb1
   =20
    and remove entry from skip_smb1_fail
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 32506f2853a6fc0445cb6f433dcb417984935da1
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 17:31:32 2019 +0000

    selftest: Move samba3.blackbox.net.misc NT1 to ad_dc_smb1 env
   =20
    Additionally remove this test from the skip file as the file doesn't
    need to be ported
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit df4b8b80b3e98a8be95a72a34cde4029845f5122
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 17:30:38 2019 +0000

    s3/selftest: Change samba3.blackbox.net.misc desc. to include protocol
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit c86171aa8b0156aea3f6454b3e7199a99d93b346
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 17:27:53 2019 +0000

    s3/selftest: Move samba3.blackbox.net.misc to ad_dc
   =20
    we have an ad_dc_smb1 env and there is not reason why we need
    to use nt4_dc for this test. In a later commit we will move the
    NT1 test to the ad_dc_smb1 env.
   =20
    Addionally we change the existing entry in the skip_smb1_fails
    skip file.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 47ad2551b443753e0fc6ef94d1eccbe0812ae532
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 17:13:27 2019 +0000

    selftest: Move samba3.blackbox.shadow_copy2 NT1 to fileserver_smb1
   =20
    Additionally since we already have a SMB3 version of the test we
    can remove it from the skip file
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 6accac62916bd259d92863644fb00083387566b1
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 15:13:44 2019 +0000

    selftest: samba3.blackbox.* so it can run SMB1 & >=3D SMB2
   =20
    Move tests that have SMB1 & >=3DSMB2 versions to fileserver_smb1_done
   =20
    Additionally this commit removes the entries for fileserver for the same
    tests from skip_smb1.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit a11c58c5f9674b23b02f2d0698951f32527d733e
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 18 10:32:59 2019 +0000

    autobuild: Add ad_dc_default_smb1 to autobuild jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 02a16b317103d25d0b34154ae5f10173f756bd73
Author: Noel Power <noel.power@suse.com>
Date:   Tue Dec 17 15:39:47 2019 +0000

    selftest/target: Add test environment ad_dc_default_smb1_done
   =20
    Adding test env ad_dc_default_smb1_done an alias for
    test environment ad_dc_default_smb1
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit ffe856ce3280b1746b6309277463e38224be5d7c
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 18 10:26:14 2019 +0000

    autobuild: Add nt4_dc_smb1_done to autobuild jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit ba3fe03b510cf4f50ede3272c8b867a8062c2a1c
Author: Noel Power <noel.power@suse.com>
Date:   Tue Dec 17 15:22:42 2019 +0000

    selftest/target: Create nt4_dc_smb1_done env (alias for nt4_dc_smb1)
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 814a6d43f4de8214f3c8762e0bfcc24dc690c8ed
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 18 10:21:49 2019 +0000

    autobuild: Add fileserver_smb1_done to autbuild jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 4948dfc63dc42fcd6247734617ebf91f8e37391f
Author: Noel Power <noel.power@suse.com>
Date:   Tue Dec 17 15:26:08 2019 +0000

    selftest/target: Add new alias environment fileserver_smb1_done
   =20
    setup_fileserver_smb1_done is an alias for setup_fileserver_smb1
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit bbce98c264fd0f6181238907e3aa8a231e63f49c
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 18 10:20:45 2019 +0000

    autobuild: Add ad_dc_smb1_done to autobuild jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 7dbfdd8121c98f694f71a143fe4571a399b772dd
Author: Noel Power <noel.power@suse.com>
Date:   Tue Dec 17 15:31:27 2019 +0000

    selftest/target: Add new alias environment ad_dc_smb1_done
   =20
    Adding ad_dc_smb1_done, and alias for test env ad_dc_smb1
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f1139ac5c60f2ed3bb2066a51619ec15542fbe85
Author: Noel Power <noel.power@suse.com>
Date:   Tue Dec 17 15:18:06 2019 +0000

    selftest/target: create return_alias_env function for Samba3.pm
   =20
    This will allow us easily create lightweight alias environments
    like ad_dc_smb1_done etc.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e468b03fc444844fb9ed085b5f63e829450cdf11
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 18 10:31:29 2019 +0000

    autobuild: Add ad_dc_default_smb1 to autobuild jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 34b14c4fd2ee538af6960e87ece8ceeca85460fc
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 16 17:39:04 2019 +0000

    selftest/target: Add new alias env ad_dc_default_smb1
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 82e4dd502530583104ca39f4f6e366ef8f784a52
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 10:24:07 2019 +0000

    autobuild: Add new nt4_dc_smb1 env to jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 3e5131e06d5b261973647ee30c3ee0a0b0cf0007
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 13 10:22:36 2019 +0000

    selftest/target: Create new nt4_dc_smb1 environment
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 087eb9d744822da9e9e8f1c67f8c3589a95856e9
Author: Noel Power <noel.power@suse.com>
Date:   Fri Dec 6 15:20:48 2019 +0000

    script: Add ad_dc_smb1 to autobuild jobs
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit b0ea347c507cac6a9d5462d3e8af3572e55d883a
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 4 15:27:04 2019 +0000

    selftest: Create new test env ad_dc_smb1
   =20
    ad_dc_smb1 is a copy of the ad_dc test environment but
    with the difference that it still supports SMB1, this will allow
    use to still run SMB1 tests for that env.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit fc0d10d02350b450f6304ea76caa99e361cdfbc8
Author: Noel Power <noel.power@suse.com>
Date:   Fri Feb 28 13:32:01 2020 +0000

    selftest/manage-ca: Add certificiate etc. for DC addcsmb1
   =20
    Preparatory commit pre adding new addc_smb1 environment.
   =20
    In order to support new addc_smb1 test environment we need new
    certificate(s) in order to satisfy some tests
    (e.g. samba4.blackbox.pkinit.*)
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 1954972cfdbcfdfdf72f1d563e188a1a3f7e3927
Author: Noel Power <noel.power@suse.com>
Date:   Tue Jan 7 10:17:49 2020 +0000

    script: Add testenv fileserver_smb1 to autobuild jobs
   =20
    Adjust the existing autobuild jobs that currently include/exclude
    test env fileserver to also use fileserver_smb1.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit fcae89684edb8be453a261641195d1a29b264bf4
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 4 11:50:48 2019 +0000

    selftest: Add new test environment fileserver_smb1
   =20
    fileserver_smb1 is a copy of the fileserver test environment but
    with the difference that it still supports SMB1, this will allow
    use to still run SMB1 tests.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit e13e0cf0cebcae2ff5adee0d1a4c61ae9f4d09a7
Author: Noel Power <noel.power@suse.com>
Date:   Thu Dec 5 17:00:29 2019 +0000

    selftest: adjust skip_file (after adjusting s4member and rpc_proxy)
   =20
    The orig skip file was created with *all* test environments by
    default not support SMB1.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit f64e032a35570e456fcfe3f0d94f060d2010c06e
Author: Noel Power <noel.power@suse.com>
Date:   Wed Dec 4 11:06:44 2019 +0000

    selftest: Allow rpc_proxy & s4member also negotiate SMB1
   =20
    Test environments rpc_proxy & s4member depend on ad_dc_ntvfs
    so these environments additionally need to also be able to
    still support SMB1.
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 49ba8f215559a126f8c4d6d722c265bdc889e966
Author: Noel Power <noel.power@suse.com>
Date:   Fri Sep 27 15:24:25 2019 +0100

    selftest: disable SMB1 from testenv(s) make >=3DSMB2 the default
   =20
    Change the values of 'min protocol' set for the various test
    environments to be SMB2_02.
   =20
    Servers will only offer protocols starting with the min specified in the
    conf files. We don't change the client value here yet (until SMB1 is
    truely gone) as we still want to be able to run SMB1 tests.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 7f2cdadfef3e631e1de17089e10ce33cfa75710a
Author: Noel Power <noel.power@suse.com>
Date:   Tue Oct 22 22:57:36 2019 +0100

    selftest: Exclude SMB1 tests that would fail when SMB1 is disabled
   =20
    Exclude the tests specified in the file 'skip_smb1_fails' which
    contains the list of tests that would fail if min protocol >=3D SMB2_02
   =20
    Note: a subsequent commit will change the default min protocol so
          in order to maintain bisectability we skip the tests before
          we change the default.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 10c879a98b9343dd99f4f343123cce67bc6d26f7
Author: Noel Power <noel.power@suse.com>
Date:   Mon Oct 21 15:27:10 2019 +0100

    selftest: Create a file to exclude tests that fail with SMB1
   =20
    skip_smb1_fails contains tests that will fail when the min protocol
    of the test environments is set to SMB2_02
   =20
    Signed-off-by: Noel Power <noel.power@suse.com>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 5898c7231856e3ccd903250bfd2160406b37121d
Author: Noel Power <noel.power@suse.com>
Date:   Wed Nov 27 08:30:06 2019 +0000

    selftest: Allow ad_dc_ntvfs negotiate smb1 still
   =20
    The default for most test envs will be changed in a future
    commit(s) to be >=3D SMB2 then we need to still allow  ad_dc_ntvfs to
    support SMB1. This will make the number of tests to port easier to
    deal with. In addition to test env ad_dc_ntvfs still supporting SMB1
    we need to do the same with test other environments that depend on
    ad_dc_ntvfs (this will be handled in followup commits).
   =20
    In addition to the above this change will ensure we don't trigger
    failures for ntvfs tests when we switch to default >=3D SMB2 which will
    make the associated skip file (added in a future commit) smaller.
   =20
    Signed-off-by: Noel Power <npower@samba.org>
    Reviewed-by: Ralph Boehme <slow@samba.org>

commit 0f83d9153cd4d84aa293a4e2aae9d212fdfd9b33
Author: Noel Power <noel.power@suse.com>
Date:   Mon Dec 9 10:12:17 2019 +0000

    s3/selftest: Fix typo in test generator script
   =20
    Introduced in a64516099936 but only makes a difference when
    environments limit protocols for testing.
   =20
    Reviewed-by: Ralph Boehme <slow@samba.org>
    Signed-off-by: Noel Power <noel.power@suse.com>

commit a45e63702503619b639b8a5c659844fd8bbe1cf9
Author: Ralph Boehme <slow@samba.org>
Date:   Fri Feb 21 17:44:55 2020 +0100

    selftest: allow SMB1 in clusteredmember env
   =20
    This is a relatively new test environment that only uses very few tests
    yet. Skip the env name rename dance for this env, but someone has to co=
nvert the
    tests later on.
   =20
    Signed-off-by: Ralph Boehme <slow@samba.org>
    Reviewed-by: Noel Power <npower@samba.org>

-----------------------------------------------------------------------

Summary of changes:
 script/autobuild.py                                |  38 +-
 selftest/create_smb1_fail_skipfile.txt             | 190 ++++++++++
 selftest/flapping                                  |   4 +-
 selftest/knownfail                                 |  78 ++--
 selftest/knownfail.d/kinit_trust                   |   2 +
 selftest/knownfail.d/password_settings             |   6 +-
 selftest/knownfail.d/smb1-tests                    |  47 +++
 ...-addcsmb1.addom2.samba.example.com-S06-cert.cer | Bin 0 -> 2567 bytes
 ...-addcsmb1.addom2.samba.example.com-S06-cert.pem | 191 ++++++++++
 ...C-addcsmb1.addom2.samba.example.com-S06-key.pem |  54 +++
 ...dcsmb1.addom2.samba.example.com-S06-openssl.cnf | 250 +++++++++++++
 ...b1.addom2.samba.example.com-S06-private-key.pem |  51 +++
 ...dcsmb1.addom2.samba.example.com-S06-private.p12 | Bin 0 -> 5317 bytes
 ...C-addcsmb1.addom2.samba.example.com-S06-req.pem |  30 ++
 .../DC-addcsmb1.addom2.samba.example.com-cert.pem  |   1 +
 ...dcsmb1.addom2.samba.example.com-private-key.pem |   1 +
 .../manage-ca/CA-samba.example.com/NewCerts/06.pem | 191 ++++++++++
 .../manage-ca/CA-samba.example.com/NewCerts/07.pem | 169 +++++++++
 .../manage-ca/CA-samba.example.com/NewCerts/08.pem | 169 +++++++++
 .../Private/CA-samba.example.com-index.txt         |   3 +
 .../Private/CA-samba.example.com-index.txt.old     |   3 +
 .../Private/CA-samba.example.com-serial.txt        |   2 +-
 .../Private/CA-samba.example.com-serial.txt.old    |   2 +-
 ...nistrator@addom2.samba.example.com-S07-cert.cer | Bin 0 -> 2340 bytes
 ...nistrator@addom2.samba.example.com-S07-cert.pem | 169 +++++++++
 ...inistrator@addom2.samba.example.com-S07-key.pem |  30 ++
 ...trator@addom2.samba.example.com-S07-openssl.cnf | 242 ++++++++++++
 ...or@addom2.samba.example.com-S07-private-key.pem |  27 ++
 ...trator@addom2.samba.example.com-S07-private.p12 | Bin 0 -> 3941 bytes
 ...inistrator@addom2.samba.example.com-S07-req.pem |  19 +
 ...administrator@addom2.samba.example.com-cert.pem |   1 +
 ...trator@addom2.samba.example.com-private-key.pem |   1 +
 ...ER-pkinit@addom2.samba.example.com-S08-cert.cer | Bin 0 -> 2305 bytes
 ...ER-pkinit@addom2.samba.example.com-S08-cert.pem | 169 +++++++++
 ...SER-pkinit@addom2.samba.example.com-S08-key.pem |  30 ++
 ...pkinit@addom2.samba.example.com-S08-openssl.cnf | 242 ++++++++++++
 ...it@addom2.samba.example.com-S08-private-key.pem |  27 ++
 ...pkinit@addom2.samba.example.com-S08-private.p12 | Bin 0 -> 3909 bytes
 ...SER-pkinit@addom2.samba.example.com-S08-req.pem |  19 +
 .../USER-pkinit@addom2.samba.example.com-cert.pem  |   1 +
 ...pkinit@addom2.samba.example.com-private-key.pem |   1 +
 selftest/manage-ca/manage-CA-samba.example.com.sh  |   4 +
 selftest/target/Samba.pm                           |   4 +
 selftest/target/Samba3.pm                          | 136 ++++++-
 selftest/target/Samba4.pm                          |  64 +++-
 selftest/todo_smb2_tests_to_port.list              | 412 +++++++++++++++++=
++++
 source3/selftest/tests.py                          | 250 ++++++++-----
 source4/selftest/tests.py                          |  48 ++-
 source4/utils/tests/test_samba_tool.sh             |   4 +-
 testprogs/blackbox/test_pdbtest.sh                 |  16 +-
 testprogs/blackbox/test_pkinit_heimdal.sh          |  36 +-
 51 files changed, 3238 insertions(+), 196 deletions(-)
 create mode 100644 selftest/create_smb1_fail_skipfile.txt
 create mode 100644 selftest/knownfail.d/kinit_trust
 create mode 100644 selftest/knownfail.d/smb1-tests
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-cert.cer
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-cert.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-key.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-openssl.cnf
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-private-key=
=2Epem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-private.p12
 create mode 100644 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-S06-req.pem
 create mode 120000 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-cert.pem
 create mode 120000 selftest/manage-ca/CA-samba.example.com/DCs/addcsmb1.ad=
dom2.samba.example.com/DC-addcsmb1.addom2.samba.example.com-private-key.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/NewCerts/06.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/NewCerts/07.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/NewCerts/08.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-cert.cer
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-cert.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-key.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-openssl.cnf
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-private-key.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-private.p12
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-S=
07-req.pem
 create mode 120000 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-c=
ert.pem
 create mode 120000 selftest/manage-ca/CA-samba.example.com/Users/administr=
ator@addom2.samba.example.com/USER-administrator@addom2.samba.example.com-p=
rivate-key.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-cert.cer
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-cert.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-key.pem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-openssl.cnf
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-private-key=
=2Epem
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-private.p12
 create mode 100644 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-S08-req.pem
 create mode 120000 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-cert.pem
 create mode 120000 selftest/manage-ca/CA-samba.example.com/Users/pkinit@ad=
dom2.samba.example.com/USER-pkinit@addom2.samba.example.com-private-key.pem
 create mode 100644 selftest/todo_smb2_tests_to_port.list


Changeset truncated at 500 lines:

diff --git a/script/autobuild.py b/script/autobuild.py
index 8cee3ecbbbf..64f8ad90961 100755
--- a/script/autobuild.py
+++ b/script/autobuild.py
@@ -198,12 +198,17 @@ tasks =3D {
         ("test", make_test(exclude_envs=3D[
             "none",
             "nt4_dc",
+            "nt4_dc_smb1",
+            "nt4_dc_smb1_done",
             "nt4_dc_schannel",
             "nt4_member",
             "ad_dc",
+            "ad_dc_smb1",
+            "ad_dc_smb1_done",
             "ad_dc_backup",
             "ad_dc_ntvfs",
             "ad_dc_default",
+            "ad_dc_default_smb1",
             "ad_dc_slowtests",
             "ad_dc_no_nss",
             "ad_dc_no_ntlm",
@@ -218,6 +223,8 @@ tasks =3D {
             "vampire_2000_dc",
             "fl2000dc",
             "fileserver",
+            "fileserver_smb1",
+            "fileserver_smb1_done",
             "maptoguest",
             "simpleserver",
             "backupfromdc",
@@ -231,10 +238,12 @@ tasks =3D {
             "vampire_dc",
             "rodc",
             "ad_dc_default",
+            "ad_dc_default_smb1",
+            "ad_dc_default_smb1_done",
             "ad_dc_slowtests",
             "schema_pair_dc",
             "schema_dc",
-            "clusteredmember",
+            "clusteredmember_smb1",
             ])),
         ("lcov", LCOV_CMD),
         ("install", "make install"),
@@ -250,12 +259,18 @@ tasks =3D {
         ("test", make_test(exclude_envs=3D[
             "none",
             "nt4_dc",
+            "nt4_dc_smb1",
+            "nt4_dc_smb1_done",
             "nt4_dc_schannel",
             "nt4_member",
             "ad_dc",
+            "ad_dc_smb1",
+            "ad_dc_smb1_done",
             "ad_dc_backup",
             "ad_dc_ntvfs",
             "ad_dc_default",
+            "ad_dc_default_smb1",
+            "ad_dc_default_smb1_done",
             "ad_dc_slowtests",
             "ad_dc_no_nss",
             "ad_dc_no_ntlm",
@@ -270,6 +285,8 @@ tasks =3D {
             "vampire_2000_dc",
             "fl2000dc",
             "fileserver",
+            "fileserver_smb1",
+            "fileserver_smb1_done",
             "maptoguest",
             "simpleserver",
             "backupfromdc",
@@ -283,10 +300,12 @@ tasks =3D {
             "vampire_dc",
             "rodc",
             "ad_dc_default",
+            "ad_dc_default_smb1",
+            "ad_dc_default_smb1_done",
             "ad_dc_slowtests",
             "schema_pair_dc",
             "schema_dc",
-            "clusteredmember",
+            "clusteredmember_smb1",
             ])),
         ("lcov", LCOV_CMD),
         ("install", "make install"),
@@ -300,6 +319,8 @@ tasks =3D {
         ("make", "make -j"),
         ("test", make_test(include_envs=3D[
             "nt4_dc",
+            "nt4_dc_smb1",
+            "nt4_dc_smb1_done",
             "nt4_dc_schannel",
             "nt4_member",
             "simpleserver",
@@ -316,6 +337,8 @@ tasks =3D {
         ("make", "make -j"),
         ("test", make_test(include_envs=3D[
             "fileserver",
+            "fileserver_smb1",
+            "fileserver_smb1_done",
             "maptoguest",
             "ktest", # ktest is also tested in samba and samba-mitkrb5
                      # but is tested here against a system Heimdal
@@ -344,6 +367,8 @@ tasks =3D {
         ("make", "make -j"),
         ("test", make_test(include_envs=3D[
             "ad_dc",
+            "ad_dc_smb1",
+            "ad_dc_smb1_done",
             "ad_dc_no_nss",
             "ad_dc_no_ntlm",
             ])),
@@ -396,7 +421,8 @@ tasks =3D {
         ("random-sleep", random_sleep(1, 1)),
         ("configure", "./configure.developer --with-selftest-prefix=3D./bi=
n/ab" + samba_configure_params),
         ("make", "make -j"),
-        ("test", make_test(include_envs=3D["ad_dc_default"])),
+        ("test", make_test(include_envs=3D[
+            "ad_dc_default", "ad_dc_default_smb1", "ad_dc_default_smb1_don=
e"])),
         ("lcov", LCOV_CMD),
         ("check-clean-tree", "script/clean-source-tree.sh"),
         ],
@@ -468,6 +494,8 @@ tasks =3D {
         ("make", "make -j"),
         ("test", make_test(include_envs=3D[
             "ad_dc",
+            "ad_dc_smb1",
+            "ad_dc_smb1_done",
             "ad_dc_no_nss",
             "ad_dc_no_ntlm",
             ])),
@@ -526,7 +554,7 @@ tasks =3D {
         ("configure", "ADDITIONAL_CFLAGS=3D'-O3 -Wp,-D_FORTIFY_SOURCE=3D2'=
 ./configure.developer --with-selftest-prefix=3D./bin/ab --abi-check-disabl=
e" + samba_configure_params),
         ("make", "make -j"),
         ("test", make_test(cmd=3D'make test', include_envs=3D["none"])),
-        ("quicktest", make_test(cmd=3D'make quicktest', include_envs=3D["a=
d_dc"])),
+        ("quicktest", make_test(cmd=3D'make quicktest', include_envs=3D["a=
d_dc", "ad_dc_smb1", "ad_dc_smb1_done"])),
         ("lcov", LCOV_CMD),
         ("install", "make install"),
         ("check-clean-tree", "script/clean-source-tree.sh"),
@@ -557,7 +585,7 @@ tasks =3D {
=20
         ("test",
          make_test(cmd=3D'make test',
-                   include_envs=3D["clusteredmember"])
+                   include_envs=3D["clusteredmember_smb1"])
         ),
=20
         # clean up:
diff --git a/selftest/create_smb1_fail_skipfile.txt b/selftest/create_smb1_=
fail_skipfile.txt
new file mode 100644
index 00000000000..aea772f171b
--- /dev/null
+++ b/selftest/create_smb1_fail_skipfile.txt
@@ -0,0 +1,190 @@
+From a85b0a942ef07b6188255b2fee2fc379e9310409 Mon Sep 17 00:00:00 2001
+From: Noel Power <noel.power@suse.com>
+Date: Fri, 27 Sep 2019 15:24:25 +0100
+Subject: [PATCH] selftest: Generate a list of skip entries for SMB1
+
+The following changes prepare the test system so we can generate
+the list of tests that fail when SMB1 can no longer be negotiated
+
+1.
+Change the values of 'min protocol' set for the various test
+environments to be SMB2_02.
+
+Servers will only offer protocols starting with the min specified in the
+conf files, we don't need to change the client value here yet (until SMB1 =
is
+truely gone)
+
+2.
+The following environments will still negotiate SMB1
+   ad_dc_ntvfs, rpc_proxy & s4member
+
+3.
+Make test wont stop on first error
+
+Once this patch is applied either
+a. Commit to gitlab or
+b. Run a private autobuild
+
+For the failing test jobs gather the stdout logs and run the parser
+
+   source4/scripting/devel/test_errors_regrex.py logfile
+
+over the output. This script will generate lines suitable for a
+skipfile.
+
+It is a good idea as a final step to say create a file e.g.
+
+    selftest/skip_smb1_fails
+
+and then exclude those tests, running CI with patch similar to wscript
+below will verify that the list of tests is complete.
+
+--- a/selftest/wscript
++++ b/selftest/wscript
+@@ -179,6 +179,9 @@ def cmd_testonly(opt):
+     else:
+         env.FILTER_OPTIONS =3D '${FILTER_XFAIL}'
+
++    # Maybe this should be optional
++    env.OPTIONS +=3D ' --exclude=3D${srcdir}/selftest/skip_smb1_fails'
++
+---
+ script/autobuild.py                           |  2 +-
+ selftest/target/Samba3.pm                     |  4 +--
+ selftest/target/Samba4.pm                     | 14 ++++++--
+ source4/scripting/devel/test_errors_regrex.py | 49 ++++++++++++++++++++++=
+++++
+ 4 files changed, 63 insertions(+), 6 deletions(-)
+ create mode 100755 source4/scripting/devel/test_errors_regrex.py
+
+diff --git a/script/autobuild.py b/script/autobuild.py
+index 85167cfa993..5bf087f652c 100755
+--- a/script/autobuild.py
++++ b/script/autobuild.py
+@@ -184,7 +184,7 @@ def format_option(name, value=3DNone):
+=20
+ def make_test(
+         cmd=3D'make test',
+-        FAIL_IMMEDIATELY=3D1,
++        FAIL_IMMEDIATELY=3D0,
+         TESTS=3D'',
+         include_envs=3DNone,
+         exclude_envs=3DNone):
+diff --git a/selftest/target/Samba3.pm b/selftest/target/Samba3.pm
+index 41d439ea91a..ca14f86e0a4 100755
+--- a/selftest/target/Samba3.pm
++++ b/selftest/target/Samba3.pm
+@@ -1708,8 +1708,8 @@ sub provision($$$$$$$$$)
+ 	panic action =3D cd $self->{srcdir} && $self->{srcdir}/selftest/gdb_back=
trace %d %\$(MAKE_TEST_BINARY)
+ 	smbd:suicide mode =3D yes
+=20
+-	client min protocol =3D CORE
+-	server min protocol =3D LANMAN1
++       client min protocol =3D SMB2_02
++       server min protocol =3D SMB2_02
+=20
+ 	workgroup =3D $domain
+=20
+diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
+index 1310e2ff09f..dd7fc807703 100755
+--- a/selftest/target/Samba4.pm
++++ b/selftest/target/Samba4.pm
+@@ -713,8 +713,8 @@ sub provision_raw_step1($$)
+ 	log level =3D $ctx->{server_loglevel}
+ 	lanman auth =3D Yes
+ 	ntlm auth =3D Yes
+-	client min protocol =3D CORE
+-	server min protocol =3D LANMAN1
++       client min protocol =3D SMB2_02
++       server min protocol =3D SMB2_02
+ 	mangled names =3D yes
+ 	dns update command =3D $ctx->{samba_dnsupdate}
+ 	spn update command =3D $ctx->{python} $ENV{SRCDIR_ABS}/source4/scripting=
/bin/samba_spnupdate -s $ctx->{smb_conf}
+@@ -1188,6 +1188,9 @@ rpc_server:winreg =3D embedded
+ rpc_server:spoolss =3D embedded
+ rpc_daemon:spoolssd =3D embedded
+ rpc_server:tcpip =3D no
++       # override the new SMB2 only default
++       client min protocol =3D CORE
++       server min protocol =3D LANMAN1
+ ";
+ 	if ($more_conf) {
+ 		$extra_smb_conf =3D $extra_smb_conf . $more_conf . "\n";
+@@ -1238,7 +1241,9 @@ sub provision_rpc_proxy($$$)
+ 	dcerpc endpoint servers =3D epmapper, remote
+ 	dcerpc_remote:interfaces =3D rpcecho
+ 	dcerpc_remote:allow_anonymous_fallback =3D yes
+-
++	# override the new SMB2 only default
++	client min protocol =3D CORE
++	server min protocol =3D LANMAN1
+ [cifs_to_dc]
+ 	path =3D /tmp/_ignore_cifs_to_dc_/_none_
+ 	read only =3D no
+@@ -1470,6 +1475,9 @@ sub provision_ad_dc_ntvfs($$$)
+ 	dsdb password event notification =3D true
+ 	dsdb group change notification =3D true
+ 	server schannel =3D auto
++	# override the new SMB2 only default
++	client min protocol =3D CORE
++	server min protocol =3D LANMAN1
+ 	";
+ 	push (@{$extra_provision_options}, "--use-ntvfs");
+ 	my $ret =3D $self->provision($prefix,
+diff --git a/source4/scripting/devel/test_errors_regrex.py b/source4/scrip=
ting/devel/test_errors_regrex.py
+new file mode 100755
+index 00000000000..eedfdbb6c35
+--- /dev/null
++++ b/source4/scripting/devel/test_errors_regrex.py
+@@ -0,0 +1,49 @@
++#!/usr/bin/env python3
++#
++# Simple script to parse make test stdout results
++# to find the tests that are in error, the scrip
++# then creates a line for each error suitable for
++# putting into a skip file.
++# This scripts intended use is in SMB1 to SMB2 test
++# porting where it can be used to parse for failing
++# scripts in the case where the test envs are set
++# to not negotiate SMB1
++#
++import sys
++import re
++import os
++
++def parse_errors(infile):
++    all_tests =3D []
++    error_tests =3D []
++    # get all test lines
++    last_err =3D ""
++    for line in infile:
++        line =3D line.rstrip(os.linesep)
++        if re.match("^\[.* at .*\]", line):
++            test_info =3D line.split(',')
++            if len(test_info) > 1:
++                err =3D test_info[1].split()[0]
++                if err !=3D last_err:
++                    error_tests.append(all_tests[-1])
++                last_err =3D err
++            all_tests.append(line.split(']',1)[1].lstrip())
++    return error_tests
++
++def main():
++    if len(sys.argv) < 2:
++        print ("no args passed")
++        sys.exit(1)
++    print ("processing %s" % sys.argv[1])
++    inputf =3D sys.argv[1]
++    f =3D open(inputf, "r")
++    failing_tests =3D parse_errors(f)
++    f.close()
++    for t in failing_tests:
++        # adust t fo regex
++        t =3D t.replace('(', '\\(').replace(')', '\\)')
++        t =3D t.replace('[', '\\[').replace(']', '\\]')
++        t =3D "^" + t
++        print("%s" % t)
++if __name__ =3D=3D '__main__':
++    main()
+--=20
+2.16.4
+
diff --git a/selftest/flapping b/selftest/flapping
index 50fdf1ed972..c9f0adbf1bd 100644
--- a/selftest/flapping
+++ b/selftest/flapping
@@ -23,8 +23,8 @@
 ^samba3.smb2.acls.DYNAMIC\(ad_dc\)  # Seems to flap - succeeds on sn-devel=
, fails on Fedora 16
 ^samba3.raw.acls.dynamic\(ad_dc\) # Seems to flap - succeeds on sn-devel, =
fails on Fedora 16
 ^samba3.raw.acls.inheritance\(ad_dc\) # Seems to flap - succeeds on sn-dev=
el, fails on Fedora 16
-^samba3.raw.samba3checkfsp.samba3checkfsp\(ad_dc\) # Seems to flap - succe=
eds on sn-devel, fails on Fedora 16
-^samba3.raw.samba3closeerr.samba3closeerr\(ad_dc\) # Seems to flap - succe=
eds on sn-devel, fails on Fedora 16
+^samba3.raw.samba3checkfsp.samba3checkfsp\(ad_dc_smb1\) # Seems to flap - =
succeeds on sn-devel, fails on Fedora 16
+^samba3.raw.samba3closeerr.samba3closeerr\(ad_dc_smb1\) # Seems to flap - =
succeeds on sn-devel, fails on Fedora 16
 ^samba4.smb2.create.mkdir-dup\(ad_dc_ntvfs\) # This test (for bug 11486) i=
nvolves a race, not always protected against in the NTVFS file server
 ^samba4.winbind.struct.domain_info.ad_member # flakey on sn-devel-104 and =
sn-devel-144
 #
diff --git a/selftest/knownfail b/selftest/knownfail
index f186b85aea7..1e2deab5f79 100644
--- a/selftest/knownfail
+++ b/selftest/knownfail
@@ -14,8 +14,8 @@
 ^samba3.smb2.session enc.reconnect # expected to give CONNECTION_DISCONNEC=
TED, we need to fix the test
 ^samba3.raw.session enc # expected to give ACCESS_DENIED as SMB1 encryptio=
n isn't used
 ^samba3.smbtorture_s3.crypt_server # expected to give ACCESS_DENIED as SMB=
1 encryption isn't used
-^samba3.smbtorture_s3.*.LOCK12.*\(fileserver\)
-^samba3.smbtorture_s3.*.LOCK12.*\(nt4_dc\)
+^samba3.smbtorture_s3.*.LOCK12.*\(fileserver_smb1\)
+^samba3.smbtorture_s3.*.LOCK12.*\(nt4_dc_smb1\)
 ^samba3.nbt.dgram.*netlogon2\(nt4_dc\)
 ^samba3.*rap.sam.*.useradd # Not provided by Samba 3
 ^samba3.*rap.sam.*.userdelete # Not provided by Samba 3
@@ -24,42 +24,48 @@
 ^samba3.smb2.rename.*.simple_nodelete
 ^samba3.smb2.rename.*.no_share_delete_no_delete_access
 ^samba3.blackbox.smbclient_machine_auth.plain.*nt4_dc:local # the NT4 DC d=
oes not currently set up a self-join
-^samba3.raw.samba3hide.samba3hide\(ad_dc\) # This test fails against the a=
d_dc environment.
-^samba3.raw.samba3closeerr.samba3closeerr\(nt4_dc\) # This test fails agai=
nst an smbd environment with NT ACLs enabled
-^samba3.raw.acls nfs4acl_xattr-simple-40.INHERITFLAGS\(nt4_dc\) # This (an=
d the follow nfs4acl_xattr tests fail because our NFSv4 backend isn't a com=
plete mapping yet.
-^samba3.raw.acls nfs4acl_xattr-simple-40.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-simple-40.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-simple-40.nulldacl\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-simple-41.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-simple-41.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-simple-41.nulldacl\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-special-40.INHERITFLAGS\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-special-40.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-special-40.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-special-40.nulldacl\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-special-40.inherit_creator_owner\(nt4_dc\)
+^samba3.raw.samba3hide.samba3hide\(ad_dc_smb1\) # This test fails against =
the ad_dc environment.
+^samba3.raw.samba3closeerr.samba3closeerr\(nt4_dc_smb1\) # This test fails=
 against an smbd environment with NT ACLs enabled
+^samba3.raw.samba3closeerr.samba3closeerr\(fileserver_smb1\) # This test f=
ails against an smbd environment with NT ACLs enabled
+^samba3.raw.acls nfs4acl_xattr-simple-40.INHERITFLAGS\(nt4_dc_smb1\) # Thi=
s (and the follow nfs4acl_xattr tests fail because our NFSv4 backend isn't =
a complete mapping yet.
+^samba3.raw.acls nfs4acl_xattr-simple-40.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-simple-40.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-simple-40.nulldacl\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-simple-41.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-simple-41.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-simple-41.nulldacl\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-special-40.INHERITFLAGS\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-special-40.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-special-40.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-special-40.nulldacl\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-special-40.inherit_creator_owner\(nt4_d_smb=
1\)
 ^samba3.raw.acls nfs4acl_xattr-special-40.inherit_creator_group\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-40.INHERITFLAGS\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-40.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-40.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-40.nulldacl\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-40.inherit_creator_owner\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-40.inherit_creator_group\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-41.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-41.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-xdr-41.nulldacl\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-40.INHERITFLAGS\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-40.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-40.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-40.nulldacl\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-40.inherit_creator_owner\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-40.inherit_creator_group\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-41.create_owner_file\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-41.create_owner_dir\(nt4_dc\)
-^samba3.raw.acls nfs4acl_xattr-nfs-41.nulldacl\(nt4_dc\)
+^samba3.raw.acls nfs4acl_xattr-xdr-40.INHERITFLAGS\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-40.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-40.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-40.nulldacl\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-40.inherit_creator_owner\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-40.inherit_creator_group\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-41.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-41.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-xdr-41.nulldacl\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-40.INHERITFLAGS\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-40.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-40.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-40.nulldacl\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-40.inherit_creator_owner\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-40.inherit_creator_group\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-41.create_owner_file\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-41.create_owner_dir\(nt4_dc_smb1\)
+^samba3.raw.acls nfs4acl_xattr-nfs-41.nulldacl\(nt4_dc_smb1\)
 ^samba3.base.delete.deltest16a
 ^samba3.base.delete.deltest17a
-^samba3.unix.whoami anonymous connection.whoami\(ad_dc\) # We need to reso=
lve if we should be including SID_NT_WORLD and SID_NT_NETWORK in this token
+^samba3.unix.whoami anonymous connection.whoami\(ad_dc_smb1\) # We need to=
 resolve if we should be including SID_NT_WORLD and SID_NT_NETWORK in this =
token
+# smbclient4 behaves differently from smbclient (s3) when encountering
+# logon failures when possesing a valid ticket. Test below has been
+# changed to use smbclient (in order to support SMB2) and this part of the
+# test fails due to this difference
+^samba4.blackbox.chgdcpass.Test login with kerberos ccache after 2nd passw=
ord change\(chgdcpass\)
 # these show that we still have some differences between our system
 # with our internal iconv because it passes except when we bypass our
 # internal iconv modules
@@ -235,7 +241,7 @@
 ^samba3.rpc.eventlog.eventlog.ReadEventLog\(ad_dc\)
 ^samba3.rpc.eventlog.eventlog.GetNumRecords\(ad_dc\)
 ^samba3.rpc.eventlog.eventlog.OpenEventLog\(ad_dc\)
-^samba3.rap.basic.netsessiongetinfo\(ad_dc\)
+^samba3.rap.basic.netsessiongetinfo\(ad_dc_smb1\)
 # not implemented
 ^samba3.rpc.svcctl.svcctl.ChangeServiceConfigW\(ad_dc\)
 ^samba3.rpc.svcctl.svcctl.ChangeServiceConfigW\(nt4_dc\)
diff --git a/selftest/knownfail.d/kinit_trust b/selftest/knownfail.d/kinit_=
trust
new file mode 100644
index 00000000000..c4ac2cae870
--- /dev/null
+++ b/selftest/knownfail.d/kinit_trust
@@ -0,0 +1,2 @@
+^samba4.blackbox.kinit_trust.Test login with.*kerberos ccache \(smbclient4=
\)\(fl2008r2dc:local\)
+^samba4.blackbox.kinit_trust.Test login with.* kerberos ccache \(smbclient=
4\)\(fl2003dc:local\)
diff --git a/selftest/knownfail.d/password_settings b/selftest/knownfail.d/=
password_settings
index 91093fe644d..4f708e64707 100644
--- a/selftest/knownfail.d/password_settings
+++ b/selftest/knownfail.d/password_settings
@@ -1,4 +1,4 @@
 # highlights a minor corner-case discrepancy between Windows and Samba
-samba4.ldap.passwordsettings.python.password_settings.PasswordSettingsTest=
Case.test_domain_pwd_history_zero\(ad_dc_default\)
-samba4.ldap.passwordsettings.python.python3.password_settings.PasswordSett=
ingsTestCase.test_domain_pwd_history_zero\(ad_dc_default\)
-samba4.ldap.passwordsettings.python.python2.password_settings.PasswordSett=
ingsTestCase.test_domain_pwd_history_zero\(ad_dc_default\)
+samba4.ldap.passwordsettings.python.password_settings.PasswordSettingsTest=
Case.test_domain_pwd_history_zero\(ad_dc_default_smb1\)
+samba4.ldap.passwordsettings.python.python3.password_settings.PasswordSett=
ingsTestCase.test_domain_pwd_history_zero\(ad_dc_default_smb1\)
+samba4.ldap.passwordsettings.python.python2.password_settings.PasswordSett=
ingsTestCase.test_domain_pwd_history_zero\(ad_dc_default_smb1\)
diff --git a/selftest/knownfail.d/smb1-tests b/selftest/knownfail.d/smb1-te=
sts
new file mode 100644
index 00000000000..7d349fdc261
--- /dev/null
+++ b/selftest/knownfail.d/smb1-tests
@@ -0,0 +1,47 @@
+^samba3.blackbox.smbclient_ntlm.plain.*NT1.smbclient anonymous.badpassword=
=2ENT1NEW.guest\(maptoguest\)
+^samba3.blackbox.smbclient_ntlm.plain.*NT1.smbclient baduser.badpassword.N=
T1NEW.guest\(maptoguest\)
+^samba3.blackbox.smbclient_ntlm.plain.*NT1.smbclient username.password.NT1=
OLD\((ad_member|fl2000dc|maptoguest|nt4_member)\)
+^samba3.blackbox.smbclient_ntlm.plain.*NT1.smbclient username.password.NT1=
NEW\((ad_member|fl2000dc|maptoguest|nt4_member)\)
+^samba3.blackbox.smbclient_ntlm.plain.*NT1.smbclient anonymous.nopassword.=
NT1OLD\((ad_member|fl2000dc|maptoguest|nt4_member)\)
+^samba3.blackbox.smbclient_ntlm.plain.*NT1.smbclient anonymous.nopassword.=
NT1NEW\((ad_member|fl2000dc|maptoguest|nt4_member)\)


--=20
Samba Shared Repository


----- End forwarded message -----

