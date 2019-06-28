Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEE5A989
	for <lists+samba-technical@lfdr.de>; Sat, 29 Jun 2019 10:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7xKPxu3BlxTSyCcdf4T1MMglsAisZOedYqjGP/7r/ws=; b=IL2ERlA9A+7ObgQrQJL7YfZPvJ
	cHQZDSc/BDMwnNpSh2fEenpLh7D9inDyZsltPcA6oFUrCoRxnwnUqpfqOmU80er3L2TRpFqAqe/D9
	QV+EbX7rNp8Sn0M6DGaFh7NlzaAn9rhI4o5avTQQn2YTG0kL35Y/rpvbmBnBK5RDkhsZ+DHW13tYj
	ebGEnIDSiDrhWfdbziKF+MrQecjNNbTMmS+7RbGaYKMx19d65lpQ1BpTaEgRfoyJUB+cz6OexdDTU
	ZHikW6obTnjF3OyB98qg7c6mwzZFiHU9QkKvt2C5HWR7O38dKxw1ied0Qa67VZIW44NChIcGHTYaB
	9GnVPMtg==;
Received: from localhost ([::1]:24044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hh8JE-002RBw-0F; Sat, 29 Jun 2019 08:02:08 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42]:32966) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgnNm-002Jga-R4
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 09:41:40 +0000
Received: by mail-wm1-f42.google.com with SMTP id h19so8955229wme.0
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 02:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=7xKPxu3BlxTSyCcdf4T1MMglsAisZOedYqjGP/7r/ws=;
 b=KclQjFM43Zs8qmkVqSJdXMm0GLJ9vLXhuE120Y3xtSP4GpEUXSymU9OCUSQvRZEWft
 QISz4tXYr8mCx89qLrt0GVypaBiE/EwPMKd4DRZ7c6b8ZgcYYfrpetzmI4vpuW8c5hAk
 5uAittBRec/xJor1xwr9BbOBXuWinfbmAAIpZxkIaQ5E5LDtHNGkd1n1sLT9Sp+ScilJ
 eHvgl735MuamUJzzEQsTHCu1ByBp5WUXKYjP6EE1AV72LMP6BjyC80Dod5pMCdtv/Ip1
 0qrnyYZkDouDTvZDOqkdc7qDfkzNoDfMj2GsJX8ax5hYZbFW8Je3VfNOUBw3GOB8G8MQ
 dcpQ==
X-Gm-Message-State: APjAAAVLxJlE8UmI04s48Ts2ChAFKkHxPUYRR27lFQzOroOGLFU4c5MA
 U076cu0/twsmWSOtONvrfl1ljkSS3j0=
X-Google-Smtp-Source: APXvYqx0qpOu4CyJEIMhEyMx+EfGI84/toAiV3nCnUNbOZjF3NGwQhgwbsRtBxBEC/fLzV3Vd9U3lw==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr6511135wmc.159.1561714885919; 
 Fri, 28 Jun 2019 02:41:25 -0700 (PDT)
Received: from amitkuma.pnq.csb ([103.83.215.66])
 by smtp.gmail.com with ESMTPSA id r131sm1353862wmf.4.2019.06.28.02.41.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 02:41:24 -0700 (PDT)
Subject: Re: Pipeline failing on samba-ad-dc-backup
 [https://gitlab.com/amitkuma/samba/-/jobs/241734878]
To: Michael Adam <obnox@samba.org>
References: <ce517e87-73cb-e018-5d66-9eb8b21a350c@redhat.com>
 <20190628084832.GE32415@samba.org>
Message-ID: <c717c972-5d58-222d-27c7-33723c87dac5@redhat.com>
Date: Fri, 28 Jun 2019 15:11:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190628084832.GE32415@samba.org>
Content-Type: multipart/mixed; boundary="------------0F298A7AB7ABA2E8B5FE44F8"
Content-Language: en-US
X-Mailman-Approved-At: Sat, 29 Jun 2019 08:02:03 +0000
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------0F298A7AB7ABA2E8B5FE44F8
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Thanks Adam.


On 06/28/2019 02:18 PM, Michael Adam wrote:
> On 2019-06-28 at 13:50 +0530, Amit Kumar via samba-technical wrote:
>> Hello,
>>
>> Not able to find why pipeline is failing
>>
>> test failed in 42 minutes, while runner timeout is 3h.
>>
>> ==> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <==
>> make: *** [test] Error 1
>> samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
>> TESTS='--include-env=backupfromdc --include-env=restoredc
>> --include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
>> --include-env=ad_dc_backup'' with status 2
>> waiting for tail to flush
>> Running: 'uname -a' in '.'
>> Running: 'lsb_release -a' in '.'
>> No LSB modules are available.
>> Running: 'free' in '.'
>> Running: 'mount' in '.'
>> Running: 'cat /proc/cpuinfo' in '.'
>> Running: 'cc --version' in '.'
>> Running: 'df -m .' in '.'
>> Running: 'df -m /tmp/samba-testbase/b22' in '.'
> This is part of the teardown code. That is not the actual test.
>
> I think you can see a hit for an error a little further up in the
> logs:
>
>>> Timed out (120 sec) waiting for dns_update_cache PID 22240 at /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm line 279.
>>> Samba 22240 failed to start up at /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm line 161.
>>> failed to start up environment 'labdc' at /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba.pm line 88.
>>> samba can't start up known environment 'labdc' at /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl line 883.
> Not sure if that's a flakey behavior..
But to get it fixed? I have attached complete pipeline output to mail.

Also, I see couple of irrelevant warnings. will send a separate mail for it.
>
> Cheers - Michael
>
>>
>>
>> ####################################################################
>>
>> AUTOBUILD FAILURE
>>
>> Your autobuild[master] on runner-fa6cab46-project-10891704-concurrent-0
>> failed after 38.6 minutes
>> when trying to test samba-ad-dc-backup with the following error:
>>
>>    samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
>> TESTS='--include-env=backupfromdc --include-env=restoredc
>> --include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
>> --include-env=ad_dc_backup'' with status 2
>>
>> the autobuild has been abandoned. Please fix the error and resubmit.
>>
>> ####################################################################
>>
>>
>> Though this is a very simple addition of print statement only:
>>
>> if gplink.strip() == '':
>> + print("gpLink is empty")
>> return ret
>>
>> Thanks
>> Amit
>>
>>


--------------0F298A7AB7ABA2E8B5FE44F8
Content-Type: text/plain; charset=UTF-8;
 name="pipeline-failure-241789179"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pipeline-failure-241789179"

[510/554] Processing source4/torture/smb2/proto.h: source4/torture/smb2/a=
cls.c source4/torture/smb2/block.c source4/torture/smb2/compound.c source=
4/torture/smb2/connect.c source4/torture/smb2/create.c source4/torture/sm=
b2/credits.c source4/torture/smb2/delete-on-close.c source4/torture/smb2/=
dir.c source4/torture/smb2/dosmode.c source4/torture/smb2/durable_open.c =
source4/torture/smb2/durable_v2_open.c source4/torture/smb2/getinfo.c sou=
rce4/torture/smb2/ioctl.c source4/torture/smb2/lease.c source4/torture/sm=
b2/lease_break_handler.c source4/torture/smb2/lock.c source4/torture/smb2=
/maxfid.c source4/torture/smb2/maxwrite.c source4/torture/smb2/multichann=
el.c source4/torture/smb2/oplock_break_handler.c source4/torture/smb2/not=
ify.c source4/torture/smb2/notify_disabled.c source4/torture/smb2/oplock.=
c source4/torture/smb2/read.c source4/torture/smb2/rename.c source4/tortu=
re/smb2/replay.c source4/torture/smb2/scan.c source4/torture/smb2/session=
=2Ec source4/torture/smb2/setinfo.c source4/torture/smb2/sharemode.c sour=
ce4/torture/smb2/smb2.c source4/torture/smb2/streams.c source4/torture/sm=
b2/util.c -> bin/default/source4/torture/smb2/proto.h
[511/554] Processing source4/torture/winbind/proto.h: source4/torture/win=
bind/winbind.c source4/torture/winbind/struct_based.c nsswitch/libwbclien=
t/tests/wbclient.c -> bin/default/source4/torture/winbind/proto.h
[512/554] Processing source4/torture/libnetapi/proto.h: source4/torture/l=
ibnetapi/libnetapi.c source4/torture/libnetapi/libnetapi_user.c source4/t=
orture/libnetapi/libnetapi_group.c source4/torture/libnetapi/libnetapi_se=
rver.c -> bin/default/source4/torture/libnetapi/proto.h
[513/554] Compiling source4/torture/libsmbclient/libsmbclient.c
[514/554] Processing source4/torture/gpo/proto.h: source4/torture/gpo/gpo=
=2Ec source4/torture/gpo/apply.c -> bin/default/source4/torture/gpo/proto=
=2Eh
[515/554] Processing source4/torture/ndr/proto.h: source4/torture/ndr/ndr=
=2Ec source4/torture/ndr/winreg.c source4/torture/ndr/atsvc.c source4/tor=
ture/ndr/lsa.c source4/torture/ndr/epmap.c source4/torture/ndr/dfs.c sour=
ce4/torture/ndr/netlogon.c source4/torture/ndr/drsuapi.c source4/torture/=
ndr/spoolss.c source4/torture/ndr/ntprinting.c source4/torture/ndr/samr.c=
 source4/torture/ndr/dfsblob.c source4/torture/ndr/drsblobs.c source4/tor=
ture/ndr/dnsp.c source4/torture/ndr/nbt.c source4/torture/ndr/ntlmssp.c s=
ource4/torture/ndr/string.c source4/torture/ndr/backupkey.c source4/tortu=
re/ndr/witness.c source4/torture/ndr/clusapi.c source4/torture/ndr/negoex=
=2Ec source4/torture/ndr/krb5pac.c source4/torture/ndr/winspool.c source4=
/torture/ndr/cabinet.c source4/torture/ndr/charset.c -> bin/default/sourc=
e4/torture/ndr/proto.h
[516/554] Processing source4/torture/rpc/proto.h: source4/torture/rpc/joi=
n.c source4/torture/rpc/lsa.c source4/torture/rpc/forest_trust.c source4/=
torture/rpc/lsa_lookup.c source4/torture/rpc/session_key.c source4/tortur=
e/rpc/echo.c source4/torture/rpc/dfs.c source4/torture/rpc/drsuapi.c sour=
ce4/torture/rpc/drsuapi_w2k8.c source4/torture/rpc/drsuapi_cracknames.c s=
ource4/torture/rpc/dsgetinfo.c source4/torture/rpc/spoolss.c source4/tort=
ure/rpc/spoolss_win.c source4/torture/rpc/spoolss_access.c source4/tortur=
e/rpc/unixinfo.c source4/torture/rpc/samr.c source4/torture/rpc/samr_acce=
ssmask.c source4/torture/rpc/samr_priv.c source4/torture/rpc/wkssvc.c sou=
rce4/torture/rpc/srvsvc.c source4/torture/rpc/svcctl.c source4/torture/rp=
c/atsvc.c source4/torture/rpc/eventlog.c source4/torture/rpc/epmapper.c s=
ource4/torture/rpc/winreg.c source4/torture/rpc/initshutdown.c source4/to=
rture/rpc/oxidresolve.c source4/torture/rpc/remact.c source4/torture/rpc/=
mgmt.c source4/torture/rpc/scanner.c source4/torture/rpc/autoidl.c source=
4/torture/rpc/countcalls.c source4/torture/rpc/testjoin.c source4/torture=
/rpc/schannel.c source4/torture/rpc/netlogon.c source4/torture/rpc/remote=
_pac.c source4/torture/rpc/samlogon.c source4/torture/rpc/samsync.c sourc=
e4/torture/rpc/dssetup.c source4/torture/rpc/alter_context.c source4/tort=
ure/rpc/bench.c source4/torture/rpc/samba3rpc.c source4/torture/rpc/rpc.c=
 source4/torture/rpc/async_bind.c source4/torture/rpc/handles.c source4/t=
orture/rpc/frsapi.c source4/torture/rpc/object_uuid.c source4/torture/rpc=
/ntsvcs.c source4/torture/rpc/browser.c source4/torture/rpc/bind.c source=
4/torture/rpc/fsrvp.c source4/torture/rpc/clusapi.c source4/torture/rpc/w=
itness.c source4/torture/rpc/iremotewinspool.c source4/torture/rpc/iremot=
ewinspool_driver.c source4/torture/rpc/backupkey.c source4/torture/rpc/sp=
oolss_notify.c -> bin/default/source4/torture/rpc/proto.h
[517/554] Processing source4/torture/drs/proto.h: source4/torture/drs/drs=
_init.c source4/torture/drs/drs_util.c source4/torture/drs/unit/prefixmap=
_tests.c source4/torture/drs/unit/schemainfo_tests.c source4/torture/drs/=
rpc/dssync.c source4/torture/drs/rpc/msds_intid.c -> bin/default/source4/=
torture/drs/proto.h
[518/554] Processing source4/torture/rap/proto.h: source4/torture/rap/rap=
=2Ec source4/torture/rap/rpc.c source4/torture/rap/printing.c source4/tor=
ture/rap/sam.c -> bin/default/source4/torture/rap/proto.h
[519/554] Processing source4/torture/dfs/proto.h: source4/torture/dfs/dom=
aindfs.c source4/torture/dfs/common.c -> bin/default/source4/torture/dfs/=
proto.h
[520/554] Processing source4/torture/auth/proto.h: source4/torture/auth/n=
tlmssp.c source4/torture/auth/pac.c source4/torture/auth/smbencrypt.c -> =
bin/default/source4/torture/auth/proto.h
[521/554] Processing source4/torture/local/proto.h: lib/util/charset/test=
s/iconv.c lib/talloc/testsuite.c source4/lib/messaging/tests/messaging.c =
source4/lib/messaging/tests/irpc.c source4/librpc/tests/binding_string.c =
lib/util/tests/idtree.c lib/util/tests/dlinklist.c source4/lib/socket/tes=
tsuite.c source4/libcli/resolve/testsuite.c lib/util/tests/strlist.c lib/=
util/tests/binsearch.c lib/util/tests/str.c lib/util/tests/time.c lib/uti=
l/tests/asn1_tests.c lib/util/tests/data_blob.c lib/util/tests/file.c lib=
/util/tests/genrand.c lib/compression/testsuite.c lib/util/charset/tests/=
charset.c lib/util/charset/tests/convert_string.c source4/libcli/security=
/tests/sddl.c lib/tdr/testsuite.c lib/tevent/testsuite.c source4/param/te=
sts/share.c lib/tevent/test_req.c source4/param/tests/loadparm.c auth/cre=
dentials/tests/simple.c source4/torture/local/local.c source4/torture/loc=
al/dbspeed.c source4/torture/local/torture.c source4/torture/ldb/ldb.c so=
urce4/dsdb/common/tests/dsdb_dn.c source4/dsdb/schema/tests/schema_syntax=
=2Ec lib/util/tests/anonymous_shared.c lib/util/tests/strv.c lib/util/tes=
ts/strv_util.c lib/util/tests/util.c lib/util/tests/util_str_escape.c lib=
/util/tests/tfork.c source4/torture/local/verif_trailer.c source4/torture=
/local/nss_tests.c source4/torture/local/fsrvp_state.c -> bin/default/sou=
rce4/torture/local/proto.h
[522/554] Processing source4/torture/krb5/proto.h: source4/torture/krb5/k=
dc-heimdal.c source4/torture/krb5/kdc-canon-heimdal.c -> bin/default/sour=
ce4/torture/krb5/proto.h
[523/554] Processing source4/torture/nbench/proto.h: source4/torture/nben=
ch/nbio.c source4/torture/nbench/nbench.c -> bin/default/source4/torture/=
nbench/proto.h
[524/554] Processing source4/torture/unix/proto.h: source4/torture/unix/u=
nix.c source4/torture/unix/whoami.c source4/torture/unix/unix_info2.c -> =
bin/default/source4/torture/unix/proto.h
[525/554] Processing source4/torture/ldap/proto.h: source4/torture/ldap/c=
ommon.c source4/torture/ldap/basic.c source4/torture/ldap/schema.c source=
4/torture/ldap/uptodatevector.c source4/torture/ldap/cldap.c source4/tort=
ure/ldap/netlogon.c source4/torture/ldap/cldapbench.c source4/torture/lda=
p/ldap_sort.c source4/torture/ldap/nested_search.c -> bin/default/source4=
/torture/ldap/proto.h
[526/554] Processing source4/torture/nbt/proto.h: source4/torture/nbt/que=
ry.c source4/torture/nbt/register.c source4/torture/nbt/wins.c source4/to=
rture/nbt/winsbench.c source4/torture/nbt/winsreplication.c source4/tortu=
re/nbt/dgram.c source4/torture/nbt/nbt.c -> bin/default/source4/torture/n=
bt/proto.h
[527/554] Processing source4/torture/libnet/proto.h: source4/torture/libn=
et/libnet.c source4/torture/libnet/utils.c source4/torture/libnet/userinf=
o.c source4/torture/libnet/userman.c source4/torture/libnet/groupinfo.c s=
ource4/torture/libnet/groupman.c source4/torture/libnet/domain.c source4/=
torture/libnet/libnet_lookup.c source4/torture/libnet/libnet_user.c sourc=
e4/torture/libnet/libnet_group.c source4/torture/libnet/libnet_share.c so=
urce4/torture/libnet/libnet_rpc.c source4/torture/libnet/libnet_domain.c =
source4/torture/libnet/libnet_BecomeDC.c -> bin/default/source4/torture/l=
ibnet/proto.h
[528/554] Compiling source4/torture/ntp/ntp_signd.c
[529/554] Processing source4/torture/vfs/proto.h: source4/torture/vfs/vfs=
=2Ec source4/torture/vfs/fruit.c source4/torture/vfs/acl_xattr.c -> bin/d=
efault/source4/torture/vfs/proto.h
[530/554] Compiling source4/dsdb/common/tests/dsdb.c
[531/554] Processing source4/libcli/ldap/ldap_proto.h: source4/libcli/lda=
p/ldap_client.c source4/libcli/ldap/ldap_bind.c source4/libcli/ldap/ldap_=
ildap.c source4/libcli/ldap/ldap_controls.c -> bin/default/source4/libcli=
/ldap/ldap_proto.h
[532/554] Compiling source4/libcli/util/clilsa.c
[533/554] Compiling source4/libcli/composite/composite.c
[534/554] Compiling source4/libcli/wrepl/winsrepl.c
[535/554] Compiling source4/libcli/resolve/resolve.c
[536/554] Processing source4/libcli/resolve/lp_proto.h: source4/libcli/re=
solve/bcast.c source4/libcli/resolve/nbtlist.c source4/libcli/resolve/win=
s.c source4/libcli/resolve/dns_ex.c source4/libcli/resolve/host.c source4=
/libcli/resolve/lmhosts.c source4/libcli/resolve/resolve_lp.c -> bin/defa=
ult/source4/libcli/resolve/lp_proto.h
[537/554] Compiling source4/libcli/finddcs_cldap.c
[538/554] Processing source4/libcli/raw/raw_proto.h: source4/libcli/raw/r=
awfile.c source4/libcli/raw/smb_signing.c source4/libcli/raw/clisocket.c =
source4/libcli/raw/clitransport.c source4/libcli/raw/clisession.c source4=
/libcli/raw/clitree.c source4/libcli/raw/clierror.c source4/libcli/raw/ra=
wrequest.c source4/libcli/raw/rawreadwrite.c source4/libcli/raw/rawsearch=
=2Ec source4/libcli/raw/rawsetfileinfo.c source4/libcli/raw/raweas.c sour=
ce4/libcli/raw/rawtrans.c source4/libcli/raw/clioplock.c source4/libcli/r=
aw/rawnegotiate.c source4/libcli/raw/rawfsinfo.c source4/libcli/raw/rawfi=
leinfo.c source4/libcli/raw/rawnotify.c source4/libcli/raw/rawioctl.c sou=
rce4/libcli/raw/rawacl.c source4/libcli/raw/rawdate.c source4/libcli/raw/=
rawlpq.c source4/libcli/raw/rawshadow.c -> bin/default/source4/libcli/raw=
/raw_proto.h
[539/554] Processing source4/libcli/smb2/smb2_proto.h: source4/libcli/smb=
2/transport.c source4/libcli/smb2/request.c source4/libcli/smb2/session.c=
 source4/libcli/smb2/tcon.c source4/libcli/smb2/create.c source4/libcli/s=
mb2/close.c source4/libcli/smb2/connect.c source4/libcli/smb2/getinfo.c s=
ource4/libcli/smb2/write.c source4/libcli/smb2/read.c source4/libcli/smb2=
/setinfo.c source4/libcli/smb2/find.c source4/libcli/smb2/ioctl.c source4=
/libcli/smb2/logoff.c source4/libcli/smb2/tdis.c source4/libcli/smb2/flus=
h.c source4/libcli/smb2/lock.c source4/libcli/smb2/notify.c source4/libcl=
i/smb2/cancel.c source4/libcli/smb2/keepalive.c source4/libcli/smb2/break=
=2Ec source4/libcli/smb2/util.c source4/libcli/smb2/signing.c source4/lib=
cli/smb2/lease_break.c -> bin/default/source4/libcli/smb2/smb2_proto.h
[540/554] Compiling source4/libcli/rap/rap.c
[541/554] Compiling libcli/nbt/nbtname.c
[542/554] Processing ../heimdal/kdc/kdc-protos.h: source4/heimdal/kdc/def=
ault_config.c source4/heimdal/kdc/kerberos5.c source4/heimdal/kdc/krb5tgs=
=2Ec source4/heimdal/kdc/pkinit.c source4/heimdal/kdc/log.c source4/heimd=
al/kdc/misc.c source4/heimdal/kdc/digest.c source4/heimdal/kdc/process.c =
source4/heimdal/kdc/windc.c source4/heimdal/kdc/kx509.c -> bin/default/so=
urce4/heimdal/kdc/kdc-protos.h
[543/554] Processing ../heimdal/kdc/kdc-private.h: source4/heimdal/kdc/de=
fault_config.c source4/heimdal/kdc/kerberos5.c source4/heimdal/kdc/krb5tg=
s.c source4/heimdal/kdc/pkinit.c source4/heimdal/kdc/log.c source4/heimda=
l/kdc/misc.c source4/heimdal/kdc/digest.c source4/heimdal/kdc/process.c s=
ource4/heimdal/kdc/windc.c source4/heimdal/kdc/kx509.c -> bin/default/sou=
rce4/heimdal/kdc/kdc-private.h
[544/554] Compiling source4/heimdal/lib/ntlm/ntlm.c
[545/554] Processing ../heimdal/lib/hdb/hdb-protos.h: source4/heimdal/lib=
/hdb/db.c source4/heimdal/lib/hdb/dbinfo.c source4/heimdal/lib/hdb/hdb.c =
source4/heimdal/lib/hdb/ext.c source4/heimdal/lib/hdb/keytab.c source4/he=
imdal/lib/hdb/hdb-keytab.c source4/heimdal/lib/hdb/mkey.c source4/heimdal=
/lib/hdb/ndbm.c bin/default/source4/heimdal/lib/hdb/hdb_err.c source4/hei=
mdal_build/hdb-glue.c -> bin/default/source4/heimdal/lib/hdb/hdb-protos.h=

[546/554] Processing ../heimdal/lib/hdb/hdb-private.h: source4/heimdal/li=
b/hdb/db.c source4/heimdal/lib/hdb/dbinfo.c source4/heimdal/lib/hdb/hdb.c=
 source4/heimdal/lib/hdb/ext.c source4/heimdal/lib/hdb/keytab.c source4/h=
eimdal/lib/hdb/hdb-keytab.c source4/heimdal/lib/hdb/mkey.c source4/heimda=
l/lib/hdb/ndbm.c bin/default/source4/heimdal/lib/hdb/hdb_err.c source4/he=
imdal_build/hdb-glue.c -> bin/default/source4/heimdal/lib/hdb/hdb-private=
=2Eh
[547/554] Processing ../heimdal/lib/gssapi/spnego/spnego-private.h: sourc=
e4/heimdal/lib/gssapi/spnego/init_sec_context.c source4/heimdal/lib/gssap=
i/spnego/external.c source4/heimdal/lib/gssapi/spnego/compat.c source4/he=
imdal/lib/gssapi/spnego/context_stubs.c source4/heimdal/lib/gssapi/spnego=
/cred_stubs.c source4/heimdal/lib/gssapi/spnego/accept_sec_context.c -> b=
in/default/source4/heimdal/lib/gssapi/spnego/spnego-private.h
[548/554] Processing ../heimdal/lib/gssapi/krb5/gsskrb5-private.h: source=
4/heimdal/lib/gssapi/krb5/copy_ccache.c source4/heimdal/lib/gssapi/krb5/d=
elete_sec_context.c source4/heimdal/lib/gssapi/krb5/init_sec_context.c so=
urce4/heimdal/lib/gssapi/krb5/context_time.c source4/heimdal/lib/gssapi/k=
rb5/init.c source4/heimdal/lib/gssapi/krb5/address_to_krb5addr.c source4/=
heimdal/lib/gssapi/krb5/get_mic.c source4/heimdal/lib/gssapi/krb5/inquire=
_context.c source4/heimdal/lib/gssapi/krb5/add_cred.c source4/heimdal/lib=
/gssapi/krb5/inquire_cred.c source4/heimdal/lib/gssapi/krb5/inquire_cred_=
by_oid.c source4/heimdal/lib/gssapi/krb5/inquire_cred_by_mech.c source4/h=
eimdal/lib/gssapi/krb5/inquire_mechs_for_name.c source4/heimdal/lib/gssap=
i/krb5/inquire_names_for_mech.c source4/heimdal/lib/gssapi/krb5/indicate_=
mechs.c source4/heimdal/lib/gssapi/krb5/inquire_sec_context_by_oid.c sour=
ce4/heimdal/lib/gssapi/krb5/export_sec_context.c source4/heimdal/lib/gssa=
pi/krb5/import_sec_context.c source4/heimdal/lib/gssapi/krb5/duplicate_na=
me.c source4/heimdal/lib/gssapi/krb5/import_name.c source4/heimdal/lib/gs=
sapi/krb5/compare_name.c source4/heimdal/lib/gssapi/krb5/export_name.c so=
urce4/heimdal/lib/gssapi/krb5/canonicalize_name.c source4/heimdal/lib/gss=
api/krb5/unwrap.c source4/heimdal/lib/gssapi/krb5/wrap.c source4/heimdal/=
lib/gssapi/krb5/release_name.c source4/heimdal/lib/gssapi/krb5/cfx.c sour=
ce4/heimdal/lib/gssapi/krb5/8003.c source4/heimdal/lib/gssapi/krb5/arcfou=
r.c source4/heimdal/lib/gssapi/krb5/encapsulate.c source4/heimdal/lib/gss=
api/krb5/display_name.c source4/heimdal/lib/gssapi/krb5/sequence.c source=
4/heimdal/lib/gssapi/krb5/display_status.c source4/heimdal/lib/gssapi/krb=
5/release_buffer.c source4/heimdal/lib/gssapi/krb5/external.c source4/hei=
mdal/lib/gssapi/krb5/compat.c source4/heimdal/lib/gssapi/krb5/creds.c sou=
rce4/heimdal/lib/gssapi/krb5/acquire_cred.c source4/heimdal/lib/gssapi/kr=
b5/release_cred.c source4/heimdal/lib/gssapi/krb5/store_cred.c source4/he=
imdal/lib/gssapi/krb5/set_cred_option.c source4/heimdal/lib/gssapi/krb5/d=
ecapsulate.c source4/heimdal/lib/gssapi/krb5/verify_mic.c source4/heimdal=
/lib/gssapi/krb5/accept_sec_context.c source4/heimdal/lib/gssapi/krb5/set=
_sec_context_option.c source4/heimdal/lib/gssapi/krb5/process_context_tok=
en.c source4/heimdal/lib/gssapi/krb5/prf.c source4/heimdal/lib/gssapi/krb=
5/aeap.c source4/heimdal/lib/gssapi/krb5/pname_to_uid.c source4/heimdal/l=
ib/gssapi/krb5/authorize_localname.c -> bin/default/source4/heimdal/lib/g=
ssapi/krb5/gsskrb5-private.h
[549/554] Processing ../heimdal/lib/krb5/krb5-private.h: source4/heimdal/=
lib/krb5/acache.c source4/heimdal/lib/krb5/add_et_list.c source4/heimdal/=
lib/krb5/addr_families.c source4/heimdal/lib/krb5/appdefault.c source4/he=
imdal/lib/krb5/asn1_glue.c source4/heimdal/lib/krb5/auth_context.c source=
4/heimdal/lib/krb5/build_ap_req.c source4/heimdal/lib/krb5/build_auth.c s=
ource4/heimdal/lib/krb5/cache.c source4/heimdal/lib/krb5/changepw.c sourc=
e4/heimdal/lib/krb5/codec.c source4/heimdal/lib/krb5/config_file.c source=
4/heimdal/lib/krb5/constants.c source4/heimdal/lib/krb5/convert_creds.c s=
ource4/heimdal/lib/krb5/copy_host_realm.c source4/heimdal/lib/krb5/crc.c =
source4/heimdal/lib/krb5/creds.c source4/heimdal/lib/krb5/crypto.c source=
4/heimdal/lib/krb5/crypto-aes.c source4/heimdal/lib/krb5/crypto-algs.c so=
urce4/heimdal/lib/krb5/crypto-arcfour.c source4/heimdal/lib/krb5/crypto-d=
es3.c source4/heimdal/lib/krb5/crypto-des.c source4/heimdal/lib/krb5/cryp=
to-des-common.c source4/heimdal/lib/krb5/crypto-evp.c source4/heimdal/lib=
/krb5/crypto-null.c source4/heimdal/lib/krb5/crypto-pk.c source4/heimdal/=
lib/krb5/crypto-rand.c source4/heimdal/lib/krb5/data.c source4/heimdal/li=
b/krb5/eai_to_heim_errno.c source4/heimdal/lib/krb5/error_string.c source=
4/heimdal/lib/krb5/expand_hostname.c source4/heimdal/lib/krb5/fcache.c so=
urce4/heimdal/lib/krb5/free.c source4/heimdal/lib/krb5/free_host_realm.c =
source4/heimdal/lib/krb5/generate_seq_number.c source4/heimdal/lib/krb5/g=
enerate_subkey.c source4/heimdal/lib/krb5/get_addrs.c source4/heimdal/lib=
/krb5/get_cred.c source4/heimdal/lib/krb5/get_default_principal.c source4=
/heimdal/lib/krb5/get_default_realm.c source4/heimdal/lib/krb5/get_for_cr=
eds.c source4/heimdal/lib/krb5/get_host_realm.c source4/heimdal/lib/krb5/=
get_in_tkt.c source4/heimdal/lib/krb5/get_port.c source4/heimdal/lib/krb5=
/init_creds.c source4/heimdal/lib/krb5/init_creds_pw.c source4/heimdal/li=
b/krb5/kcm.c source4/heimdal/lib/krb5/keyblock.c source4/heimdal/lib/krb5=
/keytab.c source4/heimdal/lib/krb5/keytab_any.c source4/heimdal/lib/krb5/=
keytab_file.c source4/heimdal/lib/krb5/keytab_memory.c source4/heimdal/li=
b/krb5/keytab_keyfile.c source4/heimdal/lib/krb5/krbhst.c source4/heimdal=
/lib/krb5/log.c source4/heimdal/lib/krb5/mcache.c source4/heimdal/lib/krb=
5/misc.c source4/heimdal/lib/krb5/mk_error.c source4/heimdal/lib/krb5/mk_=
priv.c source4/heimdal/lib/krb5/mk_rep.c source4/heimdal/lib/krb5/mk_req.=
c source4/heimdal/lib/krb5/mk_req_ext.c source4/heimdal/lib/krb5/mit_glue=
=2Ec source4/heimdal/lib/krb5/n-fold.c source4/heimdal/lib/krb5/padata.c =
source4/heimdal/lib/krb5/pkinit.c source4/heimdal/lib/krb5/principal.c so=
urce4/heimdal/lib/krb5/prog_setup.c source4/heimdal/lib/krb5/pac.c source=
4/heimdal/lib/krb5/pcache.c source4/heimdal/lib/krb5/prompter_posix.c sou=
rce4/heimdal/lib/krb5/rd_cred.c source4/heimdal/lib/krb5/rd_error.c sourc=
e4/heimdal/lib/krb5/rd_priv.c source4/heimdal/lib/krb5/rd_rep.c source4/h=
eimdal/lib/krb5/rd_req.c source4/heimdal/lib/krb5/replay.c source4/heimda=
l/lib/krb5/salt.c source4/heimdal/lib/krb5/salt-aes.c source4/heimdal/lib=
/krb5/salt-arcfour.c source4/heimdal/lib/krb5/salt-des3.c source4/heimdal=
/lib/krb5/salt-des.c source4/heimdal/lib/krb5/send_to_kdc.c source4/heimd=
al/lib/krb5/set_default_realm.c source4/heimdal/lib/krb5/store.c source4/=
heimdal/lib/krb5/store-int.c source4/heimdal/lib/krb5/store_emem.c source=
4/heimdal/lib/krb5/store_fd.c source4/heimdal/lib/krb5/store_mem.c source=
4/heimdal/lib/krb5/ticket.c source4/heimdal/lib/krb5/time.c source4/heimd=
al/lib/krb5/transited.c source4/heimdal/lib/krb5/version.c source4/heimda=
l/lib/krb5/warn.c bin/default/source4/heimdal/lib/krb5/krb5_err.c source4=
/heimdal/lib/krb5/aname_to_localname.c source4/heimdal/lib/krb5/kuserok.c=
 bin/default/source4/heimdal/lib/krb5/heim_err.c bin/default/source4/heim=
dal/lib/krb5/k524_err.c bin/default/source4/heimdal/lib/krb5/krb_err.c so=
urce4/heimdal_build/krb5-glue.c source4/heimdal/lib/krb5/expand_path.c so=
urce4/heimdal/lib/krb5/plugin.c source4/heimdal/lib/krb5/context.c -> bin=
/default/source4/heimdal/lib/krb5/krb5-private.h
[550/554] Processing ../heimdal/lib/krb5/krb5-protos.h: source4/heimdal/l=
ib/krb5/acache.c source4/heimdal/lib/krb5/add_et_list.c source4/heimdal/l=
ib/krb5/addr_families.c source4/heimdal/lib/krb5/appdefault.c source4/hei=
mdal/lib/krb5/asn1_glue.c source4/heimdal/lib/krb5/auth_context.c source4=
/heimdal/lib/krb5/build_ap_req.c source4/heimdal/lib/krb5/build_auth.c so=
urce4/heimdal/lib/krb5/cache.c source4/heimdal/lib/krb5/changepw.c source=
4/heimdal/lib/krb5/codec.c source4/heimdal/lib/krb5/config_file.c source4=
/heimdal/lib/krb5/constants.c source4/heimdal/lib/krb5/convert_creds.c so=
urce4/heimdal/lib/krb5/copy_host_realm.c source4/heimdal/lib/krb5/crc.c s=
ource4/heimdal/lib/krb5/creds.c source4/heimdal/lib/krb5/crypto.c source4=
/heimdal/lib/krb5/crypto-aes.c source4/heimdal/lib/krb5/crypto-algs.c sou=
rce4/heimdal/lib/krb5/crypto-arcfour.c source4/heimdal/lib/krb5/crypto-de=
s3.c source4/heimdal/lib/krb5/crypto-des.c source4/heimdal/lib/krb5/crypt=
o-des-common.c source4/heimdal/lib/krb5/crypto-evp.c source4/heimdal/lib/=
krb5/crypto-null.c source4/heimdal/lib/krb5/crypto-pk.c source4/heimdal/l=
ib/krb5/crypto-rand.c source4/heimdal/lib/krb5/data.c source4/heimdal/lib=
/krb5/eai_to_heim_errno.c source4/heimdal/lib/krb5/error_string.c source4=
/heimdal/lib/krb5/expand_hostname.c source4/heimdal/lib/krb5/fcache.c sou=
rce4/heimdal/lib/krb5/free.c source4/heimdal/lib/krb5/free_host_realm.c s=
ource4/heimdal/lib/krb5/generate_seq_number.c source4/heimdal/lib/krb5/ge=
nerate_subkey.c source4/heimdal/lib/krb5/get_addrs.c source4/heimdal/lib/=
krb5/get_cred.c source4/heimdal/lib/krb5/get_default_principal.c source4/=
heimdal/lib/krb5/get_default_realm.c source4/heimdal/lib/krb5/get_for_cre=
ds.c source4/heimdal/lib/krb5/get_host_realm.c source4/heimdal/lib/krb5/g=
et_in_tkt.c source4/heimdal/lib/krb5/get_port.c source4/heimdal/lib/krb5/=
init_creds.c source4/heimdal/lib/krb5/init_creds_pw.c source4/heimdal/lib=
/krb5/kcm.c source4/heimdal/lib/krb5/keyblock.c source4/heimdal/lib/krb5/=
keytab.c source4/heimdal/lib/krb5/keytab_any.c source4/heimdal/lib/krb5/k=
eytab_file.c source4/heimdal/lib/krb5/keytab_memory.c source4/heimdal/lib=
/krb5/keytab_keyfile.c source4/heimdal/lib/krb5/krbhst.c source4/heimdal/=
lib/krb5/log.c source4/heimdal/lib/krb5/mcache.c source4/heimdal/lib/krb5=
/misc.c source4/heimdal/lib/krb5/mk_error.c source4/heimdal/lib/krb5/mk_p=
riv.c source4/heimdal/lib/krb5/mk_rep.c source4/heimdal/lib/krb5/mk_req.c=
 source4/heimdal/lib/krb5/mk_req_ext.c source4/heimdal/lib/krb5/mit_glue.=
c source4/heimdal/lib/krb5/n-fold.c source4/heimdal/lib/krb5/padata.c sou=
rce4/heimdal/lib/krb5/pkinit.c source4/heimdal/lib/krb5/principal.c sourc=
e4/heimdal/lib/krb5/prog_setup.c source4/heimdal/lib/krb5/pac.c source4/h=
eimdal/lib/krb5/pcache.c source4/heimdal/lib/krb5/prompter_posix.c source=
4/heimdal/lib/krb5/rd_cred.c source4/heimdal/lib/krb5/rd_error.c source4/=
heimdal/lib/krb5/rd_priv.c source4/heimdal/lib/krb5/rd_rep.c source4/heim=
dal/lib/krb5/rd_req.c source4/heimdal/lib/krb5/replay.c source4/heimdal/l=
ib/krb5/salt.c source4/heimdal/lib/krb5/salt-aes.c source4/heimdal/lib/kr=
b5/salt-arcfour.c source4/heimdal/lib/krb5/salt-des3.c source4/heimdal/li=
b/krb5/salt-des.c source4/heimdal/lib/krb5/send_to_kdc.c source4/heimdal/=
lib/krb5/set_default_realm.c source4/heimdal/lib/krb5/store.c source4/hei=
mdal/lib/krb5/store-int.c source4/heimdal/lib/krb5/store_emem.c source4/h=
eimdal/lib/krb5/store_fd.c source4/heimdal/lib/krb5/store_mem.c source4/h=
eimdal/lib/krb5/ticket.c source4/heimdal/lib/krb5/time.c source4/heimdal/=
lib/krb5/transited.c source4/heimdal/lib/krb5/version.c source4/heimdal/l=
ib/krb5/warn.c bin/default/source4/heimdal/lib/krb5/krb5_err.c source4/he=
imdal/lib/krb5/aname_to_localname.c source4/heimdal/lib/krb5/kuserok.c bi=
n/default/source4/heimdal/lib/krb5/heim_err.c bin/default/source4/heimdal=
/lib/krb5/k524_err.c bin/default/source4/heimdal/lib/krb5/krb_err.c sourc=
e4/heimdal_build/krb5-glue.c source4/heimdal/lib/krb5/expand_path.c sourc=
e4/heimdal/lib/krb5/plugin.c source4/heimdal/lib/krb5/context.c -> bin/de=
fault/source4/heimdal/lib/krb5/krb5-protos.h
[551/554] Processing ../heimdal/lib/hx509/hx509-protos.h: source4/heimdal=
/lib/hx509/ca.c source4/heimdal/lib/hx509/cert.c source4/heimdal/lib/hx50=
9/cms.c source4/heimdal/lib/hx509/collector.c source4/heimdal/lib/hx509/c=
rypto.c source4/heimdal/lib/hx509/error.c source4/heimdal/lib/hx509/env.c=
 source4/heimdal/lib/hx509/file.c source4/heimdal/lib/hx509/keyset.c sour=
ce4/heimdal/lib/hx509/ks_dir.c source4/heimdal/lib/hx509/ks_file.c source=
4/heimdal/lib/hx509/ks_keychain.c source4/heimdal/lib/hx509/ks_mem.c sour=
ce4/heimdal/lib/hx509/ks_null.c source4/heimdal/lib/hx509/ks_p11.c source=
4/heimdal/lib/hx509/ks_p12.c source4/heimdal/lib/hx509/lock.c source4/hei=
mdal/lib/hx509/name.c source4/heimdal/lib/hx509/peer.c source4/heimdal/li=
b/hx509/print.c source4/heimdal/lib/hx509/req.c source4/heimdal/lib/hx509=
/revoke.c source4/heimdal/lib/hx509/sel.c bin/default/source4/heimdal/lib=
/hx509/hx509_err.c -> bin/default/source4/heimdal/lib/hx509/hx509-protos.=
h
[552/554] Processing ../heimdal/lib/hx509/hx509-private.h: source4/heimda=
l/lib/hx509/ca.c source4/heimdal/lib/hx509/cert.c source4/heimdal/lib/hx5=
09/cms.c source4/heimdal/lib/hx509/collector.c source4/heimdal/lib/hx509/=
crypto.c source4/heimdal/lib/hx509/error.c source4/heimdal/lib/hx509/env.=
c source4/heimdal/lib/hx509/file.c source4/heimdal/lib/hx509/keyset.c sou=
rce4/heimdal/lib/hx509/ks_dir.c source4/heimdal/lib/hx509/ks_file.c sourc=
e4/heimdal/lib/hx509/ks_keychain.c source4/heimdal/lib/hx509/ks_mem.c sou=
rce4/heimdal/lib/hx509/ks_null.c source4/heimdal/lib/hx509/ks_p11.c sourc=
e4/heimdal/lib/hx509/ks_p12.c source4/heimdal/lib/hx509/lock.c source4/he=
imdal/lib/hx509/name.c source4/heimdal/lib/hx509/peer.c source4/heimdal/l=
ib/hx509/print.c source4/heimdal/lib/hx509/req.c source4/heimdal/lib/hx50=
9/revoke.c source4/heimdal/lib/hx509/sel.c bin/default/source4/heimdal/li=
b/hx509/hx509_err.c -> bin/default/source4/heimdal/lib/hx509/hx509-privat=
e.h
[553/554] Compiling source4/kdc/sdb_to_hdb.c
[554/554] Compiling file_server/file_server.c
[555/639] Compiling bin/default/lib/ldb/include/ldb_version.h
[556/639] Compiling lib/param/param.h
[557/639] Compiling bin/default/version.h
[558/639] Compiling lib/util/charset/charset.h
[559/639] Compiling source4/param/share.h
[560/639] Compiling bin/default/librpc/gen_ndr/ndr_samr_c.h
[561/639] Compiling source4/librpc/rpc/dcerpc.h
[562/639] Compiling source4/auth/session.h
[563/639] Compiling auth/credentials/credentials.h
[564/639] Compiling nsswitch/libwbclient/wbclient.h
[565/639] Compiling lib/ldb-samba/ldb_wrap.h
[566/639] Compiling lib/util/attr.h
[567/639] Compiling lib/util/byteorder.h
[568/639] Compiling lib/util/data_blob.h
[569/639] Compiling lib/util/debug.h
[570/639] Compiling lib/util/discard.h
[571/639] Compiling lib/util/time.h
[572/639] Compiling lib/util/string_wrappers.h
[573/639] Compiling lib/util/idtree.h
[574/639] Compiling lib/util/idtree_random.h
[575/639] Compiling lib/util/blocking.h
[576/639] Compiling lib/util/signal.h
[577/639] Compiling lib/util/substitute.h
[578/639] Compiling lib/util/fault.h
[579/639] Compiling lib/util/genrand.h
[580/639] Compiling lib/util/tfork.h
[581/639] Compiling lib/util/tevent_ntstatus.h
[582/639] Compiling lib/util/tevent_unix.h
[583/639] Compiling lib/util/tevent_werror.h
[584/639] Compiling lib/util/util_ldb.h
[585/639] Compiling lib/tdr/tdr.h
[586/639] Compiling lib/tsocket/tsocket.h
[587/639] Compiling lib/tsocket/tsocket_internal.h
[588/639] Compiling source4/rpc_server/dcerpc_server.h
[589/639] Compiling bin/default/librpc/gen_ndr/auth.h
[590/639] Compiling bin/default/librpc/gen_ndr/server_id.h
[591/639] Compiling bin/default/librpc/gen_ndr/security.h
[592/639] Compiling bin/default/librpc/gen_ndr/ndr_dcerpc.h
[593/639] Compiling bin/default/librpc/gen_ndr/dcerpc.h
[594/639] Compiling librpc/ndr/ndr_dcerpc.h
[595/639] Compiling bin/default/librpc/gen_ndr/ndr_drsuapi.h
[596/639] Compiling bin/default/librpc/gen_ndr/drsuapi.h
[597/639] Compiling librpc/ndr/ndr_drsuapi.h
[598/639] Compiling bin/default/librpc/gen_ndr/ndr_drsblobs.h
[599/639] Compiling bin/default/librpc/gen_ndr/drsblobs.h
[600/639] Compiling librpc/ndr/ndr_drsblobs.h
[601/639] Compiling bin/default/librpc/gen_ndr/krb5pac.h
[602/639] Compiling bin/default/librpc/gen_ndr/ndr_krb5pac.h
[603/639] Compiling librpc/ndr/ndr_krb5pac.h
[604/639] Compiling bin/default/librpc/gen_ndr/samr.h
[605/639] Compiling bin/default/librpc/gen_ndr/ndr_samr.h
[606/639] Compiling bin/default/librpc/gen_ndr/lsa.h
[607/639] Compiling bin/default/librpc/gen_ndr/netlogon.h
[608/639] Compiling bin/default/librpc/gen_ndr/atsvc.h
[609/639] Compiling bin/default/librpc/gen_ndr/ndr_atsvc.h
[610/639] Compiling bin/default/librpc/gen_ndr/ndr_svcctl.h
[611/639] Compiling bin/default/librpc/gen_ndr/svcctl.h
[612/639] Compiling bin/default/librpc/gen_ndr/smb2_lease_struct.h
[613/639] Compiling bin/default/librpc/gen_ndr/nbt.h
[614/639] Compiling bin/default/librpc/gen_ndr/ndr_nbt.h
[615/639] Compiling librpc/ndr/ndr_nbt.h
[616/639] Compiling bin/default/librpc/gen_ndr/ndr_svcctl_c.h
[617/639] Compiling librpc/ndr/ndr_svcctl.h
[618/639] Compiling bin/default/librpc/gen_ndr/misc.h
[619/639] Compiling bin/default/librpc/gen_ndr/ndr_misc.h
[620/639] Compiling librpc/ndr/libndr.h
[621/639] Compiling librpc/rpc/rpc_common.h
[622/639] Compiling libcli/util/error.h
[623/639] Compiling libcli/util/ntstatus.h
[624/639] Compiling bin/default/libcli/util/ntstatus_gen.h
[625/639] Compiling libcli/util/doserr.h
[626/639] Compiling libcli/util/werror.h
[627/639] Compiling bin/default/libcli/util/werror_gen.h
[628/639] Compiling libcli/util/hresult.h
[629/639] Compiling libcli/util/gnutls_error.h
[630/639] Compiling libcli/auth/credentials.h
[631/639] Compiling source4/lib/policy/policy.h
[632/639] Compiling source3/lib/netapi/netapi.h
[633/639] Compiling source3/include/passdb.h
[634/639] Compiling source3/passdb/machine_sid.h
[635/639] Compiling source3/passdb/lookup_sid.h
[636/639] Compiling source3/include/smbldap.h
[637/639] Compiling source3/include/smb_ldap.h
[638/639] Compiling lib/smbconf/smbconf.h
[639/639] Compiling source3/include/libsmbclient.h
[ 640/4194] Processing GEN_NDR_TABLES: librpc/tables.pl bin/default/librp=
c/gen_ndr/ndr_atsvc.h bin/default/librpc/gen_ndr/ndr_drsuapi.h bin/defaul=
t/librpc/gen_ndr/ndr_epmapper.h bin/default/librpc/gen_ndr/ndr_initshutdo=
wn.h bin/default/librpc/gen_ndr/ndr_eventlog.h bin/default/librpc/gen_ndr=
/ndr_ntsvcs.h bin/default/librpc/gen_ndr/ndr_remact.h bin/default/librpc/=
gen_ndr/ndr_unixinfo.h bin/default/librpc/gen_ndr/ndr_browser.h bin/defau=
lt/librpc/gen_ndr/ndr_dfs.h bin/default/librpc/gen_ndr/ndr_dssetup.h bin/=
default/librpc/gen_ndr/ndr_frsapi.h bin/default/librpc/gen_ndr/ndr_rot.h =
bin/default/librpc/gen_ndr/ndr_spoolss.h bin/default/librpc/gen_ndr/ndr_w=
32time.h bin/default/librpc/gen_ndr/ndr_dnsserver.h bin/default/librpc/ge=
n_ndr/ndr_echo.h bin/default/librpc/gen_ndr/ndr_lsa.h bin/default/librpc/=
gen_ndr/ndr_oxidresolver.h bin/default/librpc/gen_ndr/ndr_samr.h bin/defa=
ult/librpc/gen_ndr/ndr_srvsvc.h bin/default/librpc/gen_ndr/ndr_winreg.h b=
in/default/librpc/gen_ndr/ndr_mgmt.h bin/default/librpc/gen_ndr/ndr_netlo=
gon.h bin/default/librpc/gen_ndr/ndr_svcctl.h bin/default/librpc/gen_ndr/=
ndr_wkssvc.h bin/default/librpc/gen_ndr/ndr_eventlog6.h bin/default/librp=
c/gen_ndr/ndr_backupkey.h bin/default/librpc/gen_ndr/ndr_fsrvp.h bin/defa=
ult/librpc/gen_ndr/ndr_witness.h bin/default/librpc/gen_ndr/ndr_clusapi.h=
 bin/default/librpc/gen_ndr/ndr_winspool.h bin/default/librpc/gen_ndr/ndr=
_wmi.h bin/default/librpc/gen_ndr/ndr_dcom.h bin/default/librpc/gen_ndr/n=
dr_audiosrv.h bin/default/librpc/gen_ndr/ndr_dsbackup.h bin/default/librp=
c/gen_ndr/ndr_efs.h bin/default/librpc/gen_ndr/ndr_frstrans.h bin/default=
/librpc/gen_ndr/ndr_frsrpc.h bin/default/librpc/gen_ndr/ndr_keysvc.h bin/=
default/librpc/gen_ndr/ndr_mdssvc.h bin/default/librpc/gen_ndr/ndr_msgsvc=
=2Eh bin/default/librpc/gen_ndr/ndr_orpc.h bin/default/librpc/gen_ndr/ndr=
_policyagent.h bin/default/librpc/gen_ndr/ndr_scerpc.h bin/default/librpc=
/gen_ndr/ndr_trkwks.h bin/default/librpc/gen_ndr/ndr_wzcsvc.h bin/default=
/librpc/gen_ndr/ndr_bkupblobs.h bin/default/librpc/gen_ndr/ndr_cab.h bin/=
default/librpc/gen_ndr/ndr_dbgidl.h bin/default/librpc/gen_ndr/ndr_file_i=
d.h bin/default/librpc/gen_ndr/ndr_fscc.h bin/default/librpc/gen_ndr/ndr_=
fsrvp_state.h bin/default/librpc/gen_ndr/ndr_ioctl.h bin/default/librpc/g=
en_ndr/ndr_named_pipe_auth.h bin/default/librpc/gen_ndr/ndr_negoex.h bin/=
default/librpc/gen_ndr/ndr_nfs4acl.h bin/default/librpc/gen_ndr/ndr_notif=
y.h bin/default/librpc/gen_ndr/ndr_ntprinting.h bin/default/librpc/gen_nd=
r/ndr_printcap.h bin/default/librpc/gen_ndr/ndr_quota.h bin/default/librp=
c/gen_ndr/ndr_rap.h bin/default/librpc/gen_ndr/ndr_schannel.h bin/default=
/librpc/gen_ndr/ndr_smb2_lease_struct.h bin/default/librpc/gen_ndr/ndr_au=
th.h bin/default/librpc/gen_ndr/ndr_dcerpc.h bin/default/librpc/gen_ndr/n=
dr_dfsblobs.h bin/default/librpc/gen_ndr/ndr_dns.h bin/default/librpc/gen=
_ndr/ndr_dnsp.h bin/default/librpc/gen_ndr/ndr_drsblobs.h bin/default/lib=
rpc/gen_ndr/ndr_idmap.h bin/default/librpc/gen_ndr/ndr_krb5pac.h bin/defa=
ult/librpc/gen_ndr/ndr_messaging.h bin/default/librpc/gen_ndr/ndr_misc.h =
bin/default/librpc/gen_ndr/ndr_nbt.h bin/default/librpc/gen_ndr/ndr_ntlms=
sp.h bin/default/librpc/gen_ndr/ndr_preg.h bin/default/librpc/gen_ndr/ndr=
_security.h bin/default/librpc/gen_ndr/ndr_server_id.h bin/default/librpc=
/gen_ndr/ndr_smb_acl.h bin/default/librpc/gen_ndr/ndr_windows_event_ids.h=
 bin/default/librpc/gen_ndr/ndr_xattr.h bin/default/librpc/gen_ndr/ndr_wi=
nbind.h bin/default/source4/librpc/gen_ndr/ndr_ntp_signd.h bin/default/so=
urce4/librpc/gen_ndr/ndr_opendb.h bin/default/source4/librpc/gen_ndr/ndr_=
sasl_helpers.h bin/default/source4/librpc/gen_ndr/ndr_winsif.h bin/defaul=
t/source4/librpc/gen_ndr/ndr_winsrepl.h bin/default/source4/librpc/gen_nd=
r/ndr_winstation.h bin/default/source4/librpc/gen_ndr/ndr_irpc.h bin/defa=
ult/source3/librpc/gen_ndr/ndr_libnetapi.h bin/default/source3/librpc/gen=
_ndr/ndr_open_files.h bin/default/source3/librpc/gen_ndr/ndr_perfcount.h =
bin/default/source3/librpc/gen_ndr/ndr_secrets.h bin/default/source3/libr=
pc/gen_ndr/ndr_libnet_join.h bin/default/source3/librpc/gen_ndr/ndr_smbXs=
rv.h bin/default/source3/librpc/gen_ndr/ndr_leases_db.h -> bin/default/so=
urce4/librpc/gen_ndr/tables.c
[ 641/4194] Processing test_headers.h: bin/default/include/public/ldb_ver=
sion.h bin/default/include/public/param.h bin/default/include/public/samb=
a/version.h bin/default/include/public/charset.h bin/default/include/publ=
ic/share.h bin/default/include/public/gen_ndr/ndr_samr_c.h bin/default/in=
clude/public/dcerpc.h bin/default/include/public/samba/session.h bin/defa=
ult/include/public/credentials.h bin/default/include/public/wbclient.h bi=
n/default/include/public/ldb_wrap.h bin/default/include/public/util/attr.=
h bin/default/include/public/util/byteorder.h bin/default/include/public/=
util/data_blob.h bin/default/include/public/util/debug.h bin/default/incl=
ude/public/util/discard.h bin/default/include/public/util/time.h bin/defa=
ult/include/public/util/string_wrappers.h bin/default/include/public/util=
/idtree.h bin/default/include/public/util/idtree_random.h bin/default/inc=
lude/public/util/blocking.h bin/default/include/public/util/signal.h bin/=
default/include/public/util/substitute.h bin/default/include/public/util/=
fault.h bin/default/include/public/util/genrand.h bin/default/include/pub=
lic/util/tfork.h bin/default/include/public/util/tevent_ntstatus.h bin/de=
fault/include/public/util/tevent_unix.h bin/default/include/public/util/t=
event_werror.h bin/default/include/public/util_ldb.h bin/default/include/=
public/tdr.h bin/default/include/public/tsocket.h bin/default/include/pub=
lic/tsocket_internal.h bin/default/include/public/dcerpc_server.h bin/def=
ault/include/public/gen_ndr/auth.h bin/default/include/public/gen_ndr/ser=
ver_id.h bin/default/include/public/gen_ndr/security.h bin/default/includ=
e/public/gen_ndr/ndr_dcerpc.h bin/default/include/public/gen_ndr/dcerpc.h=
 bin/default/include/public/ndr/ndr_dcerpc.h bin/default/include/public/g=
en_ndr/ndr_drsuapi.h bin/default/include/public/gen_ndr/drsuapi.h bin/def=
ault/include/public/ndr/ndr_drsuapi.h bin/default/include/public/gen_ndr/=
ndr_drsblobs.h bin/default/include/public/gen_ndr/drsblobs.h bin/default/=
include/public/ndr/ndr_drsblobs.h bin/default/include/public/gen_ndr/krb5=
pac.h bin/default/include/public/gen_ndr/ndr_krb5pac.h bin/default/includ=
e/public/ndr/ndr_krb5pac.h bin/default/include/public/gen_ndr/samr.h bin/=
default/include/public/gen_ndr/ndr_samr.h bin/default/include/public/gen_=
ndr/lsa.h bin/default/include/public/gen_ndr/netlogon.h bin/default/inclu=
de/public/gen_ndr/atsvc.h bin/default/include/public/gen_ndr/ndr_atsvc.h =
bin/default/include/public/gen_ndr/ndr_svcctl.h bin/default/include/publi=
c/gen_ndr/svcctl.h bin/default/include/public/smb2_lease_struct.h bin/def=
ault/include/public/gen_ndr/nbt.h bin/default/include/public/gen_ndr/ndr_=
nbt.h bin/default/include/public/ndr/ndr_nbt.h bin/default/include/public=
/gen_ndr/ndr_svcctl_c.h bin/default/include/public/ndr/ndr_svcctl.h bin/d=
efault/include/public/gen_ndr/misc.h bin/default/include/public/gen_ndr/n=
dr_misc.h bin/default/include/public/ndr.h bin/default/include/public/rpc=
_common.h bin/default/include/public/core/error.h bin/default/include/pub=
lic/core/ntstatus.h bin/default/include/public/core/ntstatus_gen.h bin/de=
fault/include/public/core/doserr.h bin/default/include/public/core/werror=
=2Eh bin/default/include/public/core/werror_gen.h bin/default/include/pub=
lic/core/hresult.h bin/default/include/public/core/gnutls_error.h bin/def=
ault/include/public/domain_credentials.h bin/default/include/public/polic=
y.h bin/default/include/public/netapi.h bin/default/include/public/passdb=
=2Eh bin/default/include/public/machine_sid.h bin/default/include/public/=
lookup_sid.h bin/default/include/public/smbldap.h bin/default/include/pub=
lic/smb_ldap.h bin/default/include/public/smbconf.h bin/default/include/p=
ublic/libsmbclient.h -> bin/default/testsuite/headers/test_headers.h
[ 642/4194] Compiling lib/talloc/talloc.c
[ 643/4194] Compiling lib/util/blocking.c
[ 644/4194] Compiling lib/util/iov_buf.c
[ 645/4194] Compiling lib/util/time_basic.c
[ 646/4194] Compiling lib/util/sys_rw.c
[ 647/4194] Compiling lib/util/sys_rw_data.c
[ 648/4194] Linking bin/default/lib/talloc/libtalloc.so
[ 649/4194] Linking bin/default/lib/util/libsocket-blocking-samba4.so
[ 650/4194] Linking bin/default/lib/util/libiov-buf-samba4.so
[ 651/4194] Linking bin/default/lib/util/libtime-basic-samba4.so
[ 652/4194] Linking bin/default/lib/util/libsys-rw-samba4.so
[ 653/4194] Compiling lib/util/close_low_fd.c
[ 654/4194] Compiling lib/util/gpfswrap.c
[ 655/4194] Compiling lib/util/debug.c
[ 656/4194] Compiling lib/tevent/tevent_standard.c
[ 657/4194] Linking bin/default/lib/util/libsamba-debug-samba4.so
[ 658/4194] Compiling lib/tevent/tevent_epoll.c
[ 659/4194] Compiling lib/tevent/tevent_timed.c
[ 660/4194] Compiling lib/tevent/tevent_util.c
[ 661/4194] Compiling lib/tevent/tevent_poll.c
[ 662/4194] Compiling lib/tevent/tevent_signal.c
[ 663/4194] Compiling lib/tevent/tevent_threads.c
[ 664/4194] Compiling lib/tevent/tevent_req.c
[ 665/4194] Compiling lib/tevent/tevent_wrapper.c
[ 666/4194] Compiling lib/tevent/tevent.c
[ 667/4194] Compiling lib/tevent/tevent_debug.c
[ 668/4194] Compiling lib/tevent/tevent_fd.c
[ 669/4194] Compiling lib/tevent/tevent_immediate.c
[ 670/4194] Compiling lib/tevent/tevent_queue.c
[ 671/4194] Compiling lib/tevent/tevent_wakeup.c
[ 672/4194] Linking bin/default/lib/tevent/libtevent.so
[ 673/4194] Compiling lib/util/genrand.c
[ 674/4194] Compiling lib/util/setid.c
[ 675/4194] Compiling source4/heimdal/lib/roken/socket.c
[ 676/4194] Compiling source4/heimdal/lib/roken/roken_gethostby.c
[ 677/4194] Compiling source4/heimdal_build/replace.c
[ 678/4194] Compiling source4/heimdal/lib/roken/resolve.c
[ 679/4194] Linking bin/default/lib/util/libgenrand-samba4.so
[ 680/4194] Linking bin/default/lib/util/libutil-setid-samba4.so
[ 681/4194] Compiling source4/heimdal/lib/roken/rand.c
[ 682/4194] Compiling source4/heimdal/lib/roken/rtbl.c
[ 683/4194] Compiling source4/heimdal/lib/roken/simple_exec.c
[ 684/4194] Compiling source4/heimdal/lib/roken/strcollect.c
[ 685/4194] Compiling source4/heimdal/lib/roken/strlwr.c
[ 686/4194] Compiling source4/heimdal/lib/roken/strpool.c
[ 687/4194] Compiling source4/heimdal/lib/roken/erealloc.c
[ 688/4194] Compiling source4/heimdal/lib/roken/estrdup.c
[ 689/4194] Compiling source4/heimdal/lib/roken/strsep_copy.c
[ 690/4194] Compiling source4/heimdal/lib/roken/strsep.c
[ 691/4194] Compiling source4/heimdal/lib/roken/strupr.c
[ 692/4194] Compiling source4/heimdal/lib/roken/emalloc.c
[ 693/4194] Compiling source4/heimdal/lib/roken/issuid.c
[ 694/4194] Compiling source4/heimdal/lib/roken/parse_time.c
[ 695/4194] Compiling source4/heimdal/lib/roken/parse_units.c
[ 696/4194] Compiling source4/heimdal/lib/roken/vis.c
[ 697/4194] Compiling source4/heimdal/lib/roken/net_read.c
[ 698/4194] Compiling source4/heimdal/lib/roken/net_write.c
[ 699/4194] Compiling source4/heimdal/lib/roken/ecalloc.c
[ 700/4194] Compiling source4/heimdal/lib/roken/get_window_size.c
[ 701/4194] Compiling source4/heimdal/lib/roken/getdtablesize.c
[ 702/4194] Compiling source4/heimdal/lib/roken/h_errno.c
[ 703/4194] Compiling source4/heimdal/lib/roken/getarg.c
[ 704/4194] Compiling source4/heimdal/lib/roken/cloexec.c
[ 705/4194] Compiling source4/heimdal/lib/roken/xfree.c
[ 706/4194] Compiling source4/heimdal/lib/roken/base64.c
[ 707/4194] Compiling source4/heimdal/lib/roken/dumpdata.c
[ 708/4194] Compiling source4/heimdal/lib/roken/bswap.c
[ 709/4194] Compiling source4/heimdal/lib/roken/hex.c
[ 710/4194] Compiling source4/heimdal/lib/roken/ct.c
[ 711/4194] Linking bin/default/source4/heimdal_build/libroken-samba4.so
[ 712/4194] Compiling lib/crypto/md4.c
[ 713/4194] Compiling lib/crypto/arcfour.c
[ 714/4194] Compiling lib/crypto/aes.c
[ 715/4194] Compiling lib/crypto/aes_cmac_128.c
[ 716/4194] Compiling lib/crypto/aes_ccm_128.c
[ 717/4194] Compiling lib/crypto/aes_gcm_128.c
[ 718/4194] Compiling lib/crypto/rijndael-alg-fst.c
[ 719/4194] Compiling dynconfig/dynconfig.c
[ 720/4194] Compiling lib/util/charset/iconv.c
[ 721/4194] Compiling lib/util/charset/util_str.c
[ 722/4194] Compiling lib/util/charset/codepoints.c
[ 723/4194] Compiling lib/util/charset/pull_push.c
[ 724/4194] Compiling lib/util/charset/util_unistr_w.c
[ 725/4194] Compiling lib/util/charset/charset_macosxfs.c
[ 726/4194] Compiling lib/util/charset/weird.c
[ 727/4194] Compiling lib/util/charset/util_unistr.c
[ 728/4194] Compiling lib/util/charset/convert_string.c
[ 729/4194] Compiling lib/util/tini.c
[ 730/4194] Compiling lib/util/tiniparser.c
[ 731/4194] Compiling lib/util/strv.c
[ 732/4194] Compiling lib/util/mkdir_p.c
[ 733/4194] Compiling lib/util/become_daemon.c
[ 734/4194] Compiling lib/util/pidfile.c
[ 735/4194] Compiling lib/util/bitmap.c
[ 736/4194] Compiling lib/util/select.c
[ 737/4194] Compiling lib/util/strv_util.c
[ 738/4194] Compiling lib/util/signal.c
[ 739/4194] Compiling lib/util/fault.c
[ 740/4194] Compiling lib/util/util_process.c
[ 741/4194] Compiling lib/util/util_strlist.c
[ 742/4194] Compiling lib/util/substitute.c
[ 743/4194] Compiling lib/util/util.c
[ 744/4194] Compiling lib/util/idtree.c
[ 745/4194] Compiling lib/util/data_blob.c
[ 746/4194] Compiling lib/util/sys_popen.c
[ 747/4194] Compiling lib/util/time.c
[ 748/4194] Compiling lib/util/util_file.c
[ 749/4194] Compiling lib/util/rbtree.c
[ 750/4194] Compiling lib/util/params.c
[ 751/4194] Compiling lib/util/idtree_random.c
[ 752/4194] Compiling lib/util/ms_fnmatch.c
[ 753/4194] Compiling lib/util/memcache.c
[ 754/4194] Compiling lib/util/getpass.c
[ 755/4194] Compiling lib/util/genrand_util.c
[ 756/4194] Compiling lib/util/util_strlist_v3.c
[ 757/4194] Compiling lib/util/fsusage.c
[ 758/4194] Compiling lib/util/util_str.c
[ 759/4194] Compiling lib/util/util_str_common.c
[ 760/4194] Compiling lib/util/util_net.c
[ 761/4194] Compiling lib/util/util_paths.c
[ 762/4194] Compiling lib/util/dprintf.c
[ 763/4194] Compiling lib/util/util_id.c
[ 764/4194] Compiling lib/util/tfork.c
[ 765/4194] Compiling lib/util/tftw.c
[ 766/4194] Compiling lib/util/unix_match.c
[ 767/4194] Compiling lib/util/system.c
[ 768/4194] Compiling lib/util/talloc_stack.c
[ 769/4194] Compiling lib/util/tevent_debug.c
[ 770/4194] Compiling lib/util/talloc_keep_secret.c
[ 771/4194] Compiling lib/util/base64.c
[ 772/4194] Compiling lib/util/smb_threads.c
[ 773/4194] Compiling lib/util/server_id.c
[ 774/4194] Compiling lib/util/rfc1738.c
[ 775/4194] Compiling lib/util/util_str_hex.c
[ 776/4194] Linking bin/default/lib/util/libsamba-util.so
[ 777/4194] Compiling libcli/util/errmap_unix.c
[ 778/4194] Compiling libcli/util/hresult.c
[ 779/4194] Compiling libcli/util/doserr.c
[ 780/4194] Compiling libcli/util/errormap.c
[ 781/4194] Compiling libcli/util/nterr.c
[ 782/4194] Compiling libcli/util/gnutls_error.c
[ 783/4194] Linking bin/default/libcli/util/libsamba-errors.so
[ 784/4194] Compiling source4/heimdal/lib/com_err/com_err.c
[ 785/4194] Compiling source4/heimdal/lib/com_err/error.c
[ 786/4194] Compiling librpc/ndr/util.c
[ 787/4194] Compiling librpc/ndr/ndr.c
[ 788/4194] Compiling librpc/ndr/ndr_misc.c
[ 789/4194] Compiling bin/default/librpc/gen_ndr/ndr_misc.c
[ 790/4194] Linking bin/default/source4/heimdal_build/libcom_err-samba4.s=
o
[ 791/4194] Compiling librpc/ndr/ndr_basic.c
[ 792/4194] Compiling librpc/ndr/ndr_string.c
[ 793/4194] Compiling librpc/ndr/uuid.c
[ 794/4194] Linking bin/default/librpc/libndr.so
[ 795/4194] Compiling source4/heimdal/lib/asn1/der_copy.c
[ 796/4194] Compiling source4/heimdal/lib/asn1/der_cmp.c
[ 797/4194] Compiling source4/heimdal/lib/asn1/extra.c
[ 798/4194] Compiling source4/heimdal/lib/asn1/timegm.c
[ 799/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_err.c
[ 800/4194] Compiling source4/heimdal/lib/asn1/der_get.c
[ 801/4194] Compiling source4/heimdal/lib/asn1/der_free.c
[ 802/4194] Compiling source4/heimdal/lib/asn1/der_length.c
[ 803/4194] Compiling source4/heimdal/lib/asn1/der_format.c
[ 804/4194] Compiling source4/heimdal/lib/asn1/der_put.c
[ 805/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_rfc2459_a=
sn1.c
[ 806/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_krb5_asn1=
=2Ec
[ 807/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_pkinit_as=
n1.c
[ 808/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_cms_asn1.=
c
[ 809/4194] Linking bin/default/source4/heimdal_build/libasn1-samba4.so
[ 810/4194] Compiling lib/tdb/common/error.c
[ 811/4194] Compiling lib/tdb/common/check.c
[ 812/4194] Compiling lib/tdb/common/tdb.c
[ 813/4194] Compiling lib/tdb/common/traverse.c
[ 814/4194] Compiling lib/tdb/common/freelistcheck.c
[ 815/4194] Compiling lib/tdb/common/lock.c
[ 816/4194] Compiling lib/tdb/common/dump.c
[ 817/4194] Compiling lib/tdb/common/freelist.c
[ 818/4194] Compiling lib/tdb/common/hash.c
[ 819/4194] Compiling lib/tdb/common/summary.c
[ 820/4194] Compiling lib/tdb/common/mutex.c
[ 821/4194] Compiling lib/tdb/common/rescue.c
[ 822/4194] Compiling lib/tdb/common/io.c
[ 823/4194] Compiling lib/tdb/common/open.c
[ 824/4194] Compiling lib/tdb/common/transaction.c
[ 825/4194] Linking bin/default/lib/tdb/libtdb.so
[ 826/4194] Compiling librpc/ndr/ndr_sec_helper.c
[ 827/4194] Compiling bin/default/librpc/gen_ndr/ndr_security.c
[ 828/4194] Compiling libcli/security/create_descriptor.c
[ 829/4194] Compiling libcli/security/display_sec.c
[ 830/4194] Compiling libcli/security/util_sid.c
[ 831/4194] Compiling libcli/security/session.c
[ 832/4194] Compiling libcli/security/secdesc.c
[ 833/4194] Compiling libcli/security/secacl.c
[ 834/4194] Compiling libcli/security/privileges.c
[ 835/4194] Compiling libcli/security/access_check.c
[ 836/4194] Compiling libcli/security/object_tree.c
[ 837/4194] Compiling libcli/security/security_token.c
[ 838/4194] Compiling libcli/security/security_descriptor.c
[ 839/4194] Compiling libcli/security/sddl.c
[ 840/4194] Compiling libcli/security/secace.c
[ 841/4194] Compiling libcli/security/dom_sid.c
[ 842/4194] Linking bin/default/libcli/security/libsamba-security-samba4.=
so
[ 843/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_exptmo=
d.c
[ 844/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_2expt.=
c
[ 845/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_exptmo=
d_fast.c
[ 846/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
=2Ec
[ 847/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_fast_mp_m=
ontgomery_reduce.c
[ 848/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_montgo=
mery_setup.c
[ 849/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mul.c
[ 850/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_invmod=
=2Ec
[ 851/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_fast_mp_i=
nvmod.c
[ 852/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_lcm.c
[ 853/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_karats=
uba_mul.c
[ 854/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_gcd.c
[ 855/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mul_2d=
=2Ec
[ 856/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_sqrmod=
=2Ec
[ 857/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_s_mp_sub.=
c
[ 858/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mulmod=
=2Ec
[ 859/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_submod=
=2Ec
[ 860/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_cmp_d.=
c
[ 861/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_sub.c
[ 862/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_addmod=
=2Ec
[ 863/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_s_mp_sqr.=
c
[ 864/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_add.c
[ 865/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_expt_d=
=2Ec
[ 866/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_s_mp_add.=
c
[ 867/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mod_d.=
c
[ 868/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_montgo=
mery_reduce.c
[ 869/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_div_d.=
c
[ 870/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mul_2.=
c
[ 871/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_fast_s_mp=
_sqr.c
[ 872/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mul_d.=
c
[ 873/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mod_2d=
=2Ec
[ 874/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_sub_d.=
c
[ 875/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_s_mp_mul_=
high_digs.c
[ 876/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_add_d.=
c
[ 877/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_fast_s_mp=
_mul_high_digs.c
[ 878/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_mod.c
[ 879/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_div_2d=
=2Ec
[ 880/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_div_2.=
c
[ 881/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_div.c
[ 882/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_lshd.c=

[ 883/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_init_s=
et_int.c
[ 884/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_to_uns=
igned_bin_n.c
[ 885/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bncore.c
[ 886/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_invmod=
_slow.c
[ 887/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
rabin_miller_trials.c
[ 888/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_to_sig=
ned_bin_n.c
[ 889/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_clamp.=
c
[ 890/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_exch.c=

[ 891/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_init_s=
et.c
[ 892/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_is_squ=
are.c
[ 893/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_set.c
[ 894/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_get_in=
t.c
[ 895/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_sqrt.c=

[ 896/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_fwrite=
=2Ec
[ 897/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_clear_=
multi.c
[ 898/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_toradi=
x_n.c
[ 899/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
random_ex.c
[ 900/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_init.c=

[ 901/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_zero.c=

[ 902/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_exteuc=
lid.c
[ 903/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_grow.c=

[ 904/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_error.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/libtommath/bn_error.c:22:17: warning:=
 initialization discards =E2=80=98const=E2=80=99 qualifier from pointer t=
arget type [-Wdiscarded-qualifiers]
      { MP_OKAY, "Successful" },
                 ^~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/libtommath/bn_error.c:23:17: warning:=
 initialization discards =E2=80=98const=E2=80=99 qualifier from pointer t=
arget type [-Wdiscarded-qualifiers]
      { MP_MEM,  "Out of heap" },
                 ^~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/libtommath/bn_error.c:24:17: warning:=
 initialization discards =E2=80=98const=E2=80=99 qualifier from pointer t=
arget type [-Wdiscarded-qualifiers]
      { MP_VAL,  "Value out of range" }
                 ^~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/libtommath/bn_error.c: In function =E2=
=80=98mp_error_to_string=E2=80=99:
=2E./../source4/heimdal/lib/hcrypto/libtommath/bn_error.c:40:11: warning:=
 return discards =E2=80=98const=E2=80=99 qualifier from pointer target ty=
pe [-Wdiscarded-qualifiers]
    return "Invalid error code";
           ^~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 905/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_copy.c=

[ 906/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_init_s=
ize.c
[ 907/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_init_m=
ulti.c
[ 908/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_cnt_ls=
b.c
[ 909/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_shrink=
=2Ec
[ 910/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_zero_m=
ulti.c
[ 911/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_clear.=
c
[ 912/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_fread.=
c
[ 913/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_set_in=
t.c
[ 914/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_radix_=
size.c
[ 915/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_neg.c
[ 916/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_read_r=
adix.c
[ 917/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_abs.c
[ 918/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_toradi=
x.c
[ 919/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_radix_=
smap.c
[ 920/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_2k_setup_l.c
[ 921/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_2k_l.c
[ 922/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_is_2k_l.c
[ 923/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_2k_setup.c
[ 924/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_init_c=
opy.c
[ 925/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_is_2k.c
[ 926/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_cmp_ma=
g.c
[ 927/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_toom_s=
qr.c
[ 928/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_2k.c
[ 929/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_s_mp_expt=
mod.c
[ 930/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_div_3.=
c
[ 931/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_reduce=
_setup.c
[ 932/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_toom_m=
ul.c
[ 933/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_dr_red=
uce.c
[ 934/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_dr_set=
up.c
[ 935/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_dr_is_=
modulus.c
[ 936/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_isprim=
e.c
[ 937/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_find_p=
rime.c
[ 938/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
next_prime.c
[ 939/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
is_prime.c
[ 940/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_s_mp_mul_=
digs.c
[ 941/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_sqr.c
[ 942/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
miller_rabin.c
[ 943/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
fermat.c
[ 944/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_prime_tab=
=2Ec
[ 945/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_prime_=
is_divisible.c
[ 946/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_rand.c=

[ 947/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_montgo=
mery_calc_normalization.c
[ 948/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_or.c
[ 949/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_cmp.c
[ 950/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_rshd.c=

[ 951/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_and.c
[ 952/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_signed=
_bin_size.c
[ 953/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_xor.c
[ 954/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_fast_s_mp=
_mul_digs.c
[ 955/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_karats=
uba_sqr.c
[ 956/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_to_uns=
igned_bin.c
[ 957/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_unsign=
ed_bin_size.c
[ 958/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_to_sig=
ned_bin.c
[ 959/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_read_u=
nsigned_bin.c
[ 960/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_read_s=
igned_bin.c
[ 961/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_n_root=
=2Ec
[ 962/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_reverse.c=

[ 963/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_count_=
bits.c
[ 964/4194] Compiling source4/heimdal/lib/hcrypto/libtommath/bn_mp_jacobi=
=2Ec
[ 965/4194] Compiling source4/heimdal/lib/hcrypto/des.c
[ 966/4194] Compiling source4/heimdal/lib/hcrypto/dh.c
[ 967/4194] Compiling source4/heimdal/lib/hcrypto/dh-ltm.c
[ 968/4194] Compiling source4/heimdal/lib/hcrypto/bn.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_is_b=
it_set=E2=80=99:
=2E./../source4/heimdal/lib/hcrypto/bn.c:243:24: warning: cast discards =E2=
=80=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     heim_integer *hi =3D (heim_integer *)bn;
                        ^
=2E./../source4/heimdal/lib/hcrypto/bn.c: In function =E2=80=98hc_BN_get_=
word=E2=80=99:
=2E./../source4/heimdal/lib/hcrypto/bn.c:311:24: warning: cast discards =E2=
=80=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     heim_integer *hi =3D (heim_integer *)bn;
                        ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 969/4194] Compiling source4/heimdal/lib/hcrypto/aes.c
[ 970/4194] Compiling source4/heimdal/lib/hcrypto/validate.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/validate.c:63:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:66:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:68:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:69:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\xdc\x95\xc0\x78\xa2\x40\x89\x89\xad\x48\xa2\x14\x92\x84\x20\x87"
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:70:5: warning: missing ini=
tializer for field =E2=80=98outiv=E2=80=99 of =E2=80=98struct tests=E2=80=
=99 [-Wmissing-field-initializers]
     },
     ^
=2E./../source4/heimdal/lib/hcrypto/validate.c:56:11: note: =E2=80=98outi=
v=E2=80=99 declared here
     void *outiv;
           ^~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:86:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\x19\x17\xff\xe6\xbb\x77\x2e\xfc"
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:90:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\xbf\x9a\x12\xb7\x26\x69\xfd\x05",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:92:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:93:2: warning: initializat=
ion discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wdiscarded-qualifiers]
  "\x55\x95\x97\x76\xa9\x6c\x66\x40\x64\xc7\xf4\x1c\x21\xb7\x14\x1b"
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:94:5: warning: missing ini=
tializer for field =E2=80=98outiv=E2=80=99 of =E2=80=98struct tests=E2=80=
=99 [-Wmissing-field-initializers]
     },
     ^
=2E./../source4/heimdal/lib/hcrypto/validate.c:56:11: note: =E2=80=98outi=
v=E2=80=99 declared here
     void *outiv;
           ^~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:111:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x01\x23\x45\x67\x89\xAB\xCD\xEF",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:115:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x00\x00\x00\x00\x00\x00\x00\x00",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:116:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x74\x94\xC2\xE7\x10\x4B\x08\x79",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:122:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x61\x8a\x63\xd2\xfb",
  ^~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:126:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\xdc\xee\x4c\xf9\x2c",
  ^~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:127:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\xf1\x38\x29\xc9\xde",
  ^~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:133:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x29\x04\x19\x72\xfb\x42\xba\x5f\xc7\x12\x77\x12\xf1\x38\x29\xc9",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:137:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x52\x75\x69\x73\x6c\x69\x6e\x6e"
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:176:2: warning: initializa=
tion discards =E2=80=98const=E2=80=99 qualifier from pointer target type =
[-Wdiscarded-qualifiers]
  "\x35\x81\x86\x99\x90\x01\xe6\xb5"
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hcrypto/validate.c:215:5: warning: missing in=
itializer for field =E2=80=98outiv=E2=80=99 of =E2=80=98struct tests=E2=80=
=99 [-Wmissing-field-initializers]
     }
     ^
=2E./../source4/heimdal/lib/hcrypto/validate.c:56:11: note: =E2=80=98outi=
v=E2=80=99 declared here
     void *outiv;
           ^~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 971/4194] Compiling source4/heimdal/lib/hcrypto/common.c
[ 972/4194] Compiling source4/heimdal/lib/hcrypto/camellia-ntt.c
[ 973/4194] Compiling source4/heimdal/lib/hcrypto/hmac.c
[ 974/4194] Compiling source4/heimdal/lib/hcrypto/camellia.c
[ 975/4194] Compiling source4/heimdal/lib/hcrypto/rand-timer.c
[ 976/4194] Compiling source4/heimdal/lib/hcrypto/rand-unix.c
[ 977/4194] Compiling source4/heimdal/lib/hcrypto/rand-fortuna.c
[ 978/4194] Compiling source4/heimdal/lib/hcrypto/rand-egd.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/rand-egd.c: In function =E2=80=98egd_=
seed=E2=80=99:
=2E./../source4/heimdal/lib/hcrypto/rand-egd.c:145:12: warning: cast disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wcast-q=
ual]
  indata =3D ((unsigned char *)indata) + len;
            ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 979/4194] Compiling source4/heimdal/lib/hcrypto/rand.c
[ 980/4194] Compiling source4/heimdal/lib/hcrypto/pkcs12.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/pkcs12.c: In function =E2=80=98hc_PKC=
S12_key_gen=E2=80=99:
=2E./../source4/heimdal/lib/hcrypto/pkcs12.c:85:14: warning: cast discard=
s =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual=
]
      I[i] =3D ((unsigned char*)salt)[i % saltlen];
              ^
=2E./../source4/heimdal/lib/hcrypto/pkcs12.c:96:33: warning: cast discard=
s =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual=
]
      I[(i * 2) + size_I + 1] =3D ((unsigned char*)key)[i % (keylen + 1)]=
;
                                 ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 981/4194] Compiling source4/heimdal/lib/hcrypto/pkcs5.c
[ 982/4194] Compiling source4/heimdal/lib/hcrypto/evp-hcrypto.c
[ 983/4194] Compiling source4/heimdal/lib/hcrypto/ui.c
[ 984/4194] Compiling source4/heimdal/lib/hcrypto/evp.c
[ 985/4194] Compiling source4/heimdal/lib/hcrypto/sha512.c
[ 986/4194] Compiling source4/heimdal/lib/hcrypto/sha.c
[ 987/4194] Compiling source4/heimdal/lib/hcrypto/sha256.c
[ 988/4194] Compiling source4/heimdal/lib/hcrypto/rnd_keys.c
[ 989/4194] Compiling source4/heimdal/lib/hcrypto/rijndael-alg-fst.c
[ 990/4194] Compiling source4/heimdal/lib/hcrypto/rc4.c
[ 991/4194] Compiling source4/heimdal/lib/hcrypto/rc2.c
[ 992/4194] Compiling source4/heimdal/lib/hcrypto/rsa-ltm.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/rsa-ltm.c: In function =E2=80=98ltm_r=
sa_private_encrypt=E2=80=99:
=2E./../source4/heimdal/lib/hcrypto/rsa-ltm.c:336:9: warning: declaration=
 of =E2=80=98p=E2=80=99 shadows a previous local [-Wshadow]
  mp_int p, q, dmp1, dmq1, iqmp;
         ^
=2E./../source4/heimdal/lib/hcrypto/rsa-ltm.c:290:20: note: shadowed decl=
aration is here
     unsigned char *p, *p0;
                    ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 993/4194] Compiling source4/heimdal/lib/hcrypto/rsa.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/rsa.c:512:1: warning: missing initial=
izer for field =E2=80=98rsa_keygen=E2=80=99 of =E2=80=98RSA_METHOD {aka c=
onst struct RSA_METHOD}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/hcrypto/rsa.c:43:0:
=2E./../source4/heimdal/lib/hcrypto/rsa.h:96:11: note: =E2=80=98rsa_keyge=
n=E2=80=99 declared here
     int (*rsa_keygen)(RSA *, int, BIGNUM *, BN_GENCB *);
           ^~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 994/4194] Compiling source4/heimdal/lib/hcrypto/md5.c
[ 995/4194] Compiling source4/heimdal/lib/hcrypto/md4.c
[ 996/4194] Compiling source4/heimdal/lib/hcrypto/md2.c
[ 997/4194] Compiling source4/heimdal/lib/hcrypto/engine.c
[ 998/4194] Compiling source4/heimdal/lib/hcrypto/dsa.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hcrypto/dsa.c:93:1: warning: missing initiali=
zer for field =E2=80=98dsa_do_sign=E2=80=99 of =E2=80=98DSA_METHOD {aka c=
onst struct DSA_METHOD}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/hcrypto/dsa.c:38:0:
=2E./../source4/heimdal/lib/hcrypto/dsa.h:73:17: note: =E2=80=98dsa_do_si=
gn=E2=80=99 declared here
     DSA_SIG * (*dsa_do_sign)(const unsigned char *, int, DSA *);
                 ^~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[ 999/4194] Linking bin/default/source4/heimdal_build/libhcrypto-samba4.s=
o
[1000/4194] Compiling source4/heimdal/lib/wind/ldap.c
[1001/4194] Compiling source4/heimdal/lib/wind/map.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/wind/map.c: In function =E2=80=98_wind_string=
prep_map=E2=80=99:
=2E./../source4/heimdal/lib/wind/map.c:61:9: warning: missing initializer=
 for field =E2=80=98val_len=E2=80=99 of =E2=80=98struct translation=E2=80=
=99 [-Wmissing-field-initializers]
  struct translation ts =3D {in[i]};
         ^~~~~~~~~~~
In file included from ../../source4/heimdal/lib/wind/map.c:41:0:
source4/heimdal/lib/wind/map_table.h:11:18: note: =E2=80=98val_len=E2=80=99=
 declared here
   unsigned short val_len;
                  ^~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1002/4194] Compiling bin/default/source4/heimdal/lib/wind/bidi_table.c
[1003/4194] Compiling source4/heimdal/lib/wind/utf8.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/wind/utf8.c: In function =E2=80=98wind_ucs4ut=
f8=E2=80=99:
=2E./../source4/heimdal/lib/wind/utf8.c:207:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
   ch =3D ch >> 6;
   ~~~^~~~~~~~~
=2E./../source4/heimdal/lib/wind/utf8.c:208:6: note: here
      case 3:
      ^~~~
=2E./../source4/heimdal/lib/wind/utf8.c:210:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
   ch =3D ch >> 6;
   ~~~^~~~~~~~~
=2E./../source4/heimdal/lib/wind/utf8.c:211:6: note: here
      case 2:
      ^~~~
=2E./../source4/heimdal/lib/wind/utf8.c:213:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
   ch =3D ch >> 6;
   ~~~^~~~~~~~~
=2E./../source4/heimdal/lib/wind/utf8.c:214:6: note: here
      case 1:
      ^~~~
=2E./../source4/heimdal/lib/wind/utf8.c: In function =E2=80=98wind_ucs2ut=
f8=E2=80=99:
=2E./../source4/heimdal/lib/wind/utf8.c:482:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
   ch =3D ch >> 6;
   ~~~^~~~~~~~~
=2E./../source4/heimdal/lib/wind/utf8.c:483:6: note: here
      case 2:
      ^~~~
=2E./../source4/heimdal/lib/wind/utf8.c:485:6: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
   ch =3D ch >> 6;
   ~~~^~~~~~~~~
=2E./../source4/heimdal/lib/wind/utf8.c:486:6: note: here
      case 1:
      ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1004/4194] Compiling source4/heimdal/lib/wind/bidi.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/wind/bidi.c: In function =E2=80=98is_ral=E2=80=
=99:
=2E./../source4/heimdal/lib/wind/bidi.c:54:12: warning: missing initializ=
er for field =E2=80=98len=E2=80=99 of =E2=80=98struct range_entry=E2=80=99=
 [-Wmissing-field-initializers]
     struct range_entry ee =3D {cp};
            ^~~~~~~~~~~
In file included from ../../source4/heimdal/lib/wind/bidi.c:38:0:
source4/heimdal/lib/wind/bidi_table.h:11:12: note: =E2=80=98len=E2=80=99 =
declared here
   unsigned len;
            ^~~
=2E./../source4/heimdal/lib/wind/bidi.c: In function =E2=80=98is_l=E2=80=99=
:
=2E./../source4/heimdal/lib/wind/bidi.c:64:12: warning: missing initializ=
er for field =E2=80=98len=E2=80=99 of =E2=80=98struct range_entry=E2=80=99=
 [-Wmissing-field-initializers]
     struct range_entry ee =3D {cp};
            ^~~~~~~~~~~
In file included from ../../source4/heimdal/lib/wind/bidi.c:38:0:
source4/heimdal/lib/wind/bidi_table.h:11:12: note: =E2=80=98len=E2=80=99 =
declared here
   unsigned len;
            ^~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1005/4194] Compiling bin/default/source4/heimdal/lib/wind/combining_tabl=
e.c
[1006/4194] Compiling source4/heimdal/lib/wind/combining.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/wind/combining.c: In function =E2=80=98_wind_=
combining_class=E2=80=99:
=2E./../source4/heimdal/lib/wind/combining.c:52:12: warning: missing init=
ializer for field =E2=80=98combining_class=E2=80=99 of =E2=80=98struct tr=
anslation=E2=80=99 [-Wmissing-field-initializers]
     struct translation ts =3D {code_point};
            ^~~~~~~~~~~
In file included from ../../source4/heimdal/lib/wind/combining.c:38:0:
source4/heimdal/lib/wind/combining_table.h:11:12: note: =E2=80=98combinin=
g_class=E2=80=99 declared here
   unsigned combining_class;
            ^~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1007/4194] Compiling bin/default/source4/heimdal/lib/wind/normalize_tabl=
e.c
[1008/4194] Compiling source4/heimdal/lib/wind/normalize.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/wind/normalize.c: In function =E2=80=98compat=
_decomp=E2=80=99:
=2E./../source4/heimdal/lib/wind/normalize.c:130:9: warning: missing init=
ializer for field =E2=80=98val_len=E2=80=99 of =E2=80=98struct translatio=
n=E2=80=99 [-Wmissing-field-initializers]
  struct translation ts =3D {in[i]};
         ^~~~~~~~~~~
In file included from ../../source4/heimdal/lib/wind/normalize.c:46:0:
source4/heimdal/lib/wind/normalize_table.h:13:18: note: =E2=80=98val_len=E2=
=80=99 declared here
   unsigned short val_len;
                  ^~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1009/4194] Compiling bin/default/source4/heimdal/lib/wind/errorlist_tabl=
e.c
[1010/4194] Compiling source4/heimdal/lib/wind/stringprep.c
[1011/4194] Compiling source4/heimdal/lib/wind/errorlist.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/wind/errorlist.c: In function =E2=80=98_wind_=
stringprep_error=E2=80=99:
=2E./../source4/heimdal/lib/wind/errorlist.c:54:12: warning: missing init=
ializer for field =E2=80=98len=E2=80=99 of =E2=80=98struct error_entry=E2=
=80=99 [-Wmissing-field-initializers]
     struct error_entry ee =3D {cp};
            ^~~~~~~~~~~
In file included from ../../source4/heimdal/lib/wind/errorlist.c:38:0:
source4/heimdal/lib/wind/errorlist_table.h:11:12: note: =E2=80=98len=E2=80=
=99 declared here
   unsigned len;
            ^~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1012/4194] Compiling bin/default/source4/heimdal/lib/wind/wind_err.c
[1013/4194] Compiling bin/default/source4/heimdal/lib/wind/map_table.c
[1014/4194] Linking bin/default/source4/heimdal_build/libwind-samba4.so
[1015/4194] Compiling librpc/ndr/ndr_nbt.c
[1016/4194] Compiling bin/default/librpc/gen_ndr/ndr_nbt.c
[1017/4194] Compiling libcli/nbt/nbtname.c
[1018/4194] Compiling source4/heimdal/base/array.c
[1019/4194] Compiling source4/heimdal/base/bool.c
[1020/4194] Compiling source4/heimdal/base/null.c
[1021/4194] Linking bin/default/librpc/libndr-nbt.so
[1022/4194] Compiling source4/heimdal/base/number.c
[1023/4194] Compiling source4/heimdal/base/string.c
[1024/4194] Compiling source4/heimdal/base/heimbase.c
[1025/4194] Compiling source4/heimdal/base/dict.c
[1026/4194] Linking bin/default/source4/heimdal_build/libheimbase-samba4.=
so
[1027/4194] Compiling bin/default/source4/heimdal/lib/hx509/asn1_ocsp_asn=
1.c
[1028/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_pkcs8_asn=
1.c
[1029/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_pkcs9_asn=
1.c
[1030/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_pkcs12_as=
n1.c
[1031/4194] Compiling bin/default/source4/heimdal/lib/hx509/asn1_pkcs10_a=
sn1.c
[1032/4194] Compiling source4/heimdal/lib/hx509/sel-gram.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/sel-gram.c:2:19: warning: =E2=80=98yysc=
csid=E2=80=99 defined but not used [-Wunused-const-variable=3D]
 static const char yysccsid[] =3D "@(#)yaccpar 1.9 (Berkeley) 02/21/93";
                   ^~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1033/4194] Compiling bin/default/source4/heimdal/lib/hx509/hx509_err.c
[1034/4194] Compiling source4/heimdal/lib/hx509/sel-lex.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/sel-lex.c:1176:17: warning: =E2=80=98yy=
unput=E2=80=99 defined but not used [-Wunused-function]
     static void yyunput (int c, register char * yy_bp )
                 ^~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1035/4194] Compiling source4/heimdal/lib/hx509/sel.c
[1036/4194] Compiling source4/heimdal/lib/hx509/revoke.c
[1037/4194] Compiling source4/heimdal/lib/hx509/req.c
[1038/4194] Compiling source4/heimdal/lib/hx509/print.c
[1039/4194] Compiling source4/heimdal/lib/hx509/peer.c
[1040/4194] Compiling source4/heimdal/lib/hx509/lock.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/lock.c:51:1: warning: missing initializ=
er for field =E2=80=98certs=E2=80=99 of =E2=80=98struct hx509_lock_data=E2=
=80=99 [-Wmissing-field-initializers]
 };
 ^
=2E./../source4/heimdal/lib/hx509/lock.c:44:17: note: =E2=80=98certs=E2=80=
=99 declared here
     hx509_certs certs;
                 ^~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1041/4194] Compiling source4/heimdal/lib/hx509/name.c
[1042/4194] Compiling source4/heimdal/lib/hx509/ks_p12.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/ks_p12.c:701:1: warning: missing initia=
lizer for field =E2=80=98printinfo=E2=80=99 of =E2=80=98struct hx509_keys=
et_ops=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/hx509/ks_p12.c:34:0:
=2E./../source4/heimdal/lib/hx509/hx_locl.h:169:11: note: =E2=80=98printi=
nfo=E2=80=99 declared here
     int (*printinfo)(hx509_context, hx509_certs,
           ^~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1043/4194] Compiling source4/heimdal/lib/hx509/ks_p11.c
[1044/4194] Compiling source4/heimdal/lib/hx509/ks_keychain.c
[1045/4194] Compiling source4/heimdal/lib/hx509/ks_mem.c
[1046/4194] Compiling source4/heimdal/lib/hx509/ks_null.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/ks_null.c:91:1: warning: missing initia=
lizer for field =E2=80=98printinfo=E2=80=99 of =E2=80=98struct hx509_keys=
et_ops=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/hx509/ks_null.c:34:0:
=2E./../source4/heimdal/lib/hx509/hx_locl.h:169:11: note: =E2=80=98printi=
nfo=E2=80=99 declared here
     int (*printinfo)(hx509_context, hx509_certs,
           ^~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1047/4194] Compiling source4/heimdal/lib/hx509/ks_dir.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/ks_dir.c:215:1: warning: missing initia=
lizer for field =E2=80=98printinfo=E2=80=99 of =E2=80=98struct hx509_keys=
et_ops=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/hx509/ks_dir.c:34:0:
=2E./../source4/heimdal/lib/hx509/hx_locl.h:169:11: note: =E2=80=98printi=
nfo=E2=80=99 declared here
     int (*printinfo)(hx509_context, hx509_certs,
           ^~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1048/4194] Compiling source4/heimdal/lib/hx509/ks_file.c
[1049/4194] Compiling source4/heimdal/lib/hx509/keyset.c
[1050/4194] Compiling source4/heimdal/lib/hx509/file.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/file.c: In function =E2=80=98hx509_pem_=
read=E2=80=99:
=2E./../source4/heimdal/lib/hx509/file.c:229:9: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
      if (p =3D=3D NULL) {
         ^
=2E./../source4/heimdal/lib/hx509/file.c:234:2: note: here
  case INHEADER:
  ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1051/4194] Compiling source4/heimdal/lib/hx509/env.c
[1052/4194] Compiling source4/heimdal/lib/hx509/error.c
[1053/4194] Compiling source4/heimdal/lib/hx509/collector.c
[1054/4194] Compiling source4/heimdal/lib/hx509/crypto.c
[1055/4194] Compiling source4/heimdal/lib/hx509/cms.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/cms.c: In function =E2=80=98fill_CMSIde=
ntifier=E2=80=99:
=2E./../source4/heimdal/lib/hx509/cms.c:183:5: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
  if (ret =3D=3D 0)
     ^
=2E./../source4/heimdal/lib/hx509/cms.c:186:5: note: here
     case CMS_ID_NAME: {
     ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1056/4194] Compiling source4/heimdal/lib/hx509/cert.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hx509/cert.c: In function =E2=80=98hx509_veri=
fy_path=E2=80=99:
=2E./../source4/heimdal/lib/hx509/cert.c:2073:19: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
  case PROXY_CERT: {
                   ^
=2E./../source4/heimdal/lib/hx509/cert.c:2179:2: note: here
  case EE_CERT:
  ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1057/4194] Compiling source4/heimdal/lib/hx509/ca.c
[1058/4194] Linking bin/default/source4/heimdal_build/libhx509-samba4.so
[1059/4194] Compiling lib/util/tevent_ntstatus.c
[1060/4194] Compiling lib/util/tevent_req_profile.c
[1061/4194] Compiling lib/util/tevent_unix.c
[1062/4194] Compiling lib/util/tevent_werror.c
[1063/4194] Compiling lib/tdb_wrap/tdb_wrap.c
[1064/4194] Compiling lib/util/util_tdb.c
[1065/4194] Linking bin/default/lib/util/libtevent-util.so
[1066/4194] Compiling lib/param/loadparm_server_role.c
[1067/4194] Compiling bin/default/librpc/gen_ndr/ndr_atsvc.c
[1068/4194] Compiling bin/default/librpc/gen_ndr/ndr_dns.c
[1069/4194] Linking bin/default/lib/tdb_wrap/libtdb-wrap-samba4.so
[1070/4194] Linking bin/default/lib/util/libutil-tdb-samba4.so
[1071/4194] Compiling librpc/ndr/ndr_dns.c
[1072/4194] Linking bin/default/lib/param/libserver-role-samba4.so
[1073/4194] Compiling bin/default/librpc/gen_ndr/ndr_dfs.c
[1074/4194] Compiling bin/default/librpc/gen_ndr/ndr_winreg.c
[1075/4194] Compiling bin/default/librpc/gen_ndr/ndr_spoolss.c
[1076/4194] Compiling librpc/ndr/ndr_spoolss_buf.c
[1077/4194] Compiling bin/default/librpc/gen_ndr/ndr_dssetup.c
[1078/4194] Compiling bin/default/librpc/gen_ndr/ndr_server_id.c
[1079/4194] Compiling bin/default/librpc/gen_ndr/ndr_notify.c
[1080/4194] Compiling bin/default/librpc/gen_ndr/ndr_dnsp.c
[1081/4194] Compiling librpc/ndr/ndr_dnsp.c
[1082/4194] Compiling bin/default/librpc/gen_ndr/ndr_samr.c
[1083/4194] Compiling bin/default/librpc/gen_ndr/ndr_lsa.c
[1084/4194] Compiling librpc/ndr/ndr_svcctl.c
[1085/4194] Compiling bin/default/librpc/gen_ndr/ndr_svcctl.c
[1086/4194] Compiling bin/default/librpc/gen_ndr/ndr_srvsvc.c
[1087/4194] Compiling bin/default/librpc/gen_ndr/ndr_netlogon.c
[1088/4194] Compiling librpc/ndr/ndr_netlogon.c
[1089/4194] Compiling bin/default/librpc/gen_ndr/ndr_eventlog.c
[1090/4194] Compiling bin/default/librpc/gen_ndr/ndr_ntsvcs.c
[1091/4194] Compiling bin/default/librpc/gen_ndr/ndr_wkssvc.c
[1092/4194] Compiling bin/default/librpc/gen_ndr/ndr_echo.c
[1093/4194] Compiling bin/default/librpc/gen_ndr/ndr_initshutdown.c
[1094/4194] Compiling bin/default/librpc/gen_ndr/ndr_eventlog6.c
[1095/4194] Compiling bin/default/librpc/gen_ndr/ndr_file_id.c
[1096/4194] Linking bin/default/librpc/libndr-standard.so
[1097/4194] Compiling source4/heimdal/lib/krb5/plugin.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/plugin.c: In function =E2=80=98load_plug=
ins=E2=80=99:
=2E./../source4/heimdal/lib/krb5/plugin.c:227:10: warning: unused variabl=
e =E2=80=98d=E2=80=99 [-Wunused-variable]
     DIR *d =3D NULL;
          ^
=2E./../source4/heimdal/lib/krb5/plugin.c:226:11: warning: unused variabl=
e =E2=80=98path=E2=80=99 [-Wunused-variable]
     char *path;
           ^~~~
=2E./../source4/heimdal/lib/krb5/plugin.c:225:20: warning: unused variabl=
e =E2=80=98entry=E2=80=99 [-Wunused-variable]
     struct dirent *entry;
                    ^~~~~
=2E./../source4/heimdal/lib/krb5/plugin.c:224:27: warning: unused variabl=
e =E2=80=98di=E2=80=99 [-Wunused-variable]
     char **dirs =3D NULL, **di;
                           ^~
=2E./../source4/heimdal/lib/krb5/plugin.c:224:12: warning: unused variabl=
e =E2=80=98dirs=E2=80=99 [-Wunused-variable]
     char **dirs =3D NULL, **di;
            ^~~~
=2E./../source4/heimdal/lib/krb5/plugin.c:223:21: warning: unused variabl=
e =E2=80=98ret=E2=80=99 [-Wunused-variable]
     krb5_error_code ret;
                     ^~~
=2E./../source4/heimdal/lib/krb5/plugin.c:222:20: warning: unused variabl=
e =E2=80=98e=E2=80=99 [-Wunused-variable]
     struct plugin *e;
                    ^
At top level:
=2E./../source4/heimdal/lib/krb5/plugin.c:398:1: warning: =E2=80=98plug_d=
ealloc=E2=80=99 defined but not used [-Wunused-function]
 plug_dealloc(void *ptr)
 ^~~~~~~~~~~~
=2E./../source4/heimdal/lib/krb5/plugin.c:205:1: warning: =E2=80=98trim_t=
railing_slash=E2=80=99 defined but not used [-Wunused-function]
 trim_trailing_slash(char * path)
 ^~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/krb5/plugin.c:183:1: warning: =E2=80=98is_val=
id_plugin_filename=E2=80=99 defined but not used [-Wunused-function]
 is_valid_plugin_filename(const char * n)
 ^~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/krb5/plugin.c:66:20: warning: =E2=80=98sysplu=
gin_dirs=E2=80=99 defined but not used [-Wunused-variable]
 static const char *sysplugin_dirs[] =3D  {
                    ^~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1098/4194] Compiling source4/heimdal/lib/krb5/expand_path.c
[1099/4194] Compiling source4/heimdal/lib/krb5/context.c
[1100/4194] Compiling source4/heimdal_build/krb5-glue.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal_build/krb5-glue.c:41:1: warning: missing initiali=
zer for field =E2=80=98get_version=E2=80=99 of =E2=80=98krb5_cc_ops {aka =
const struct krb5_cc_ops}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal_build/krb5-glue.c:22:
=2E./../source4/heimdal/lib/krb5/krb5.h:492:26: note: =E2=80=98get_versio=
n=E2=80=99 declared here
     int (KRB5_CALLCONV * get_version)(krb5_context, krb5_ccache);
                          ^~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1101/4194] Compiling bin/default/source4/heimdal/lib/krb5/krb_err.c
[1102/4194] Compiling bin/default/source4/heimdal/lib/krb5/k524_err.c
[1103/4194] Compiling bin/default/source4/heimdal/lib/krb5/heim_err.c
[1104/4194] Compiling source4/heimdal/lib/krb5/kuserok.c
[1105/4194] Compiling source4/heimdal/lib/krb5/aname_to_localname.c
[1106/4194] Compiling bin/default/source4/heimdal/lib/krb5/krb5_err.c
[1107/4194] Compiling source4/heimdal/lib/krb5/warn.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/warn.c: In function =E2=80=98krb5_err=E2=
=80=99:
=2E./../source4/heimdal/lib/krb5/warn.c:83:21: warning: variable =E2=80=98=
ret=E2=80=99 set but not used [-Wunused-but-set-variable]
     krb5_error_code ret;      \
                     ^
=2E./../source4/heimdal/lib/krb5/warn.c:205:5: note: in expansion of macr=
o =E2=80=98FUNC=E2=80=99
     FUNC(1, code, 0);
     ^~~~
=2E./../source4/heimdal/lib/krb5/warn.c: In function =E2=80=98krb5_errx=E2=
=80=99:
=2E./../source4/heimdal/lib/krb5/warn.c:83:21: warning: variable =E2=80=98=
ret=E2=80=99 set but not used [-Wunused-but-set-variable]
     krb5_error_code ret;      \
                     ^
=2E./../source4/heimdal/lib/krb5/warn.c:244:5: note: in expansion of macr=
o =E2=80=98FUNC=E2=80=99
     FUNC(0, 0, 0);
     ^~~~
=2E./../source4/heimdal/lib/krb5/warn.c: In function =E2=80=98krb5_abort=E2=
=80=99:
=2E./../source4/heimdal/lib/krb5/warn.c:83:21: warning: variable =E2=80=98=
ret=E2=80=99 set but not used [-Wunused-but-set-variable]
     krb5_error_code ret;      \
                     ^
=2E./../source4/heimdal/lib/krb5/warn.c:286:5: note: in expansion of macr=
o =E2=80=98FUNC=E2=80=99
     FUNC(1, code, 0);
     ^~~~
=2E./../source4/heimdal/lib/krb5/warn.c: In function =E2=80=98krb5_abortx=
=E2=80=99:
=2E./../source4/heimdal/lib/krb5/warn.c:83:21: warning: variable =E2=80=98=
ret=E2=80=99 set but not used [-Wunused-but-set-variable]
     krb5_error_code ret;      \
                     ^
=2E./../source4/heimdal/lib/krb5/warn.c:314:5: note: in expansion of macr=
o =E2=80=98FUNC=E2=80=99
     FUNC(0, 0, 0);
     ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1108/4194] Compiling source4/heimdal/lib/krb5/version.c
[1109/4194] Compiling source4/heimdal/lib/krb5/transited.c
[1110/4194] Compiling source4/heimdal/lib/krb5/time.c
[1111/4194] Compiling source4/heimdal/lib/krb5/ticket.c
[1112/4194] Compiling source4/heimdal/lib/krb5/store_mem.c
[1113/4194] Compiling source4/heimdal/lib/krb5/store_fd.c
[1114/4194] Compiling source4/heimdal/lib/krb5/store_emem.c
[1115/4194] Compiling source4/heimdal/lib/krb5/store-int.c
[1116/4194] Compiling source4/heimdal/lib/krb5/set_default_realm.c
[1117/4194] Compiling source4/heimdal/lib/krb5/store.c
[1118/4194] Compiling source4/heimdal/lib/krb5/get_in_tkt.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/get_in_tkt.c: In function =E2=80=98add_p=
adata=E2=80=99:
=2E./../source4/heimdal/lib/krb5/get_in_tkt.c:116:26: warning: comparison=
 between =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98e=
num <anonymous>=E2=80=99 [-Wenum-compare]
  for (ep =3D enctypes; *ep !=3D ETYPE_NULL; ep++)
                          ^~
=2E./../source4/heimdal/lib/krb5/get_in_tkt.c: In function =E2=80=98krb5_=
get_in_tkt=E2=80=99:
=2E./../source4/heimdal/lib/krb5/get_in_tkt.c:545:5: warning: =E2=80=98kr=
b5_get_in_cred=E2=80=99 is deprecated [-Wdeprecated-declarations]
     ret =3D krb5_get_in_cred (context,
     ^~~
=2E./../source4/heimdal/lib/krb5/get_in_tkt.c:364:1: note: declared here
 krb5_get_in_cred(krb5_context context,
 ^~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1119/4194] Compiling source4/heimdal/lib/krb5/init_creds.c
[1120/4194] Compiling source4/heimdal/lib/krb5/kcm.c
[1121/4194] Compiling source4/heimdal/lib/krb5/init_creds_pw.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/init_creds_pw.c: In function =E2=80=98ad=
d_enc_ts_padata=E2=80=99:
=2E./../source4/heimdal/lib/krb5/init_creds_pw.c:1005:26: warning: compar=
ison between =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=
=98enum <anonymous>=E2=80=99 [-Wenum-compare]
  for (ep =3D enctypes; *ep !=3D ETYPE_NULL; ep++)
                          ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1122/4194] Compiling source4/heimdal/lib/krb5/get_port.c
[1123/4194] Compiling source4/heimdal/lib/krb5/get_cred.c
[1124/4194] Compiling source4/heimdal/lib/krb5/get_default_realm.c
[1125/4194] Compiling source4/heimdal/lib/krb5/get_host_realm.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/get_host_realm.c: In function =E2=80=98d=
ns_find_realm=E2=80=99:
=2E./../source4/heimdal/lib/krb5/get_host_realm.c:105:11: warning: to be =
safe all intermediate pointers in cast from =E2=80=98char **=E2=80=99 to =
=E2=80=98const char **=E2=80=99 must be =E2=80=98const=E2=80=99 qualified=
 [-Wcast-qual]
  labels =3D (const char **)config_labels;
           ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1126/4194] Compiling source4/heimdal/lib/krb5/get_for_creds.c
[1127/4194] Compiling source4/heimdal/lib/krb5/get_default_principal.c
[1128/4194] Compiling source4/heimdal/lib/krb5/generate_subkey.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/generate_subkey.c: In function =E2=80=98=
krb5_generate_subkey_extended=E2=80=99:
=2E./../source4/heimdal/lib/krb5/generate_subkey.c:63:15: warning: compar=
ison between =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=
=98enum <anonymous>=E2=80=99 [-Wenum-compare]
     if (etype =3D=3D ETYPE_NULL)
               ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1129/4194] Compiling source4/heimdal/lib/krb5/get_addrs.c
[1130/4194] Compiling source4/heimdal/lib/krb5/generate_seq_number.c
[1131/4194] Compiling source4/heimdal/lib/krb5/free.c
[1132/4194] Compiling source4/heimdal/lib/krb5/free_host_realm.c
[1133/4194] Compiling source4/heimdal/lib/krb5/expand_hostname.c
[1134/4194] Compiling source4/heimdal/lib/krb5/fcache.c
[1135/4194] Compiling source4/heimdal/lib/krb5/eai_to_heim_errno.c
[1136/4194] Compiling source4/heimdal/lib/krb5/error_string.c
[1137/4194] Compiling source4/heimdal/lib/krb5/data.c
[1138/4194] Compiling source4/heimdal/lib/krb5/crypto-rand.c
[1139/4194] Compiling source4/heimdal/lib/krb5/crypto-pk.c
[1140/4194] Compiling source4/heimdal/lib/krb5/crypto-null.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/crypto-null.c:49:1: warning: missing ini=
tializer for field =E2=80=98random_to_key=E2=80=99 of =E2=80=98struct _kr=
b5_key_type=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:182:0,
                 from ../../source4/heimdal/lib/krb5/crypto-null.c:34:
=2E./../source4/heimdal/lib/krb5/crypto.h:80:12: note: =E2=80=98random_to=
_key=E2=80=99 declared here
     void (*random_to_key)(krb5_context, krb5_keyblock*, const void*, siz=
e_t);
            ^~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1141/4194] Compiling source4/heimdal/lib/krb5/crypto-evp.c
[1142/4194] Compiling source4/heimdal/lib/krb5/crypto-des-common.c
[1143/4194] Compiling source4/heimdal/lib/krb5/crypto-des.c
[1144/4194] Compiling source4/heimdal/lib/krb5/crypto-des3.c
[1145/4194] Compiling source4/heimdal/lib/krb5/crypto-arcfour.c
[1146/4194] Compiling source4/heimdal/lib/krb5/crypto-algs.c
[1147/4194] Compiling source4/heimdal/lib/krb5/crypto-aes.c
[1148/4194] Compiling source4/heimdal/lib/krb5/crypto.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/crypto.c: In function =E2=80=98krb5_cryp=
to_init=E2=80=99:
=2E./../source4/heimdal/lib/krb5/crypto.c:2030:14: warning: comparison be=
tween =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum=
 <anonymous>=E2=80=99 [-Wenum-compare]
     if(etype =3D=3D ETYPE_NULL)
              ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1149/4194] Compiling source4/heimdal/lib/krb5/creds.c
[1150/4194] Compiling source4/heimdal/lib/krb5/crc.c
[1151/4194] Compiling source4/heimdal/lib/krb5/copy_host_realm.c
[1152/4194] Compiling source4/heimdal/lib/krb5/convert_creds.c
[1153/4194] Compiling source4/heimdal/lib/krb5/constants.c
[1154/4194] Compiling source4/heimdal/lib/krb5/salt-des.c
[1155/4194] Compiling source4/heimdal/lib/krb5/config_file.c
[1156/4194] Compiling source4/heimdal/lib/krb5/send_to_kdc.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/send_to_kdc.c: In function =E2=80=98krb5=
_sendto=E2=80=99:
=2E./../source4/heimdal/lib/krb5/send_to_kdc.c:374:13: warning: unused va=
riable =E2=80=98i=E2=80=99 [-Wunused-variable]
      size_t i;
             ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1157/4194] Compiling source4/heimdal/lib/krb5/changepw.c
[1158/4194] Compiling source4/heimdal/lib/krb5/codec.c
[1159/4194] Compiling source4/heimdal/lib/krb5/salt-des3.c
[1160/4194] Compiling source4/heimdal/lib/krb5/salt-arcfour.c
[1161/4194] Compiling source4/heimdal/lib/krb5/cache.c
[1162/4194] Compiling source4/heimdal/lib/krb5/salt.c
[1163/4194] Compiling source4/heimdal/lib/krb5/build_auth.c
[1164/4194] Compiling source4/heimdal/lib/krb5/salt-aes.c
[1165/4194] Compiling source4/heimdal/lib/krb5/auth_context.c
[1166/4194] Compiling source4/heimdal/lib/krb5/build_ap_req.c
[1167/4194] Compiling source4/heimdal/lib/krb5/replay.c
[1168/4194] Compiling source4/heimdal/lib/krb5/rd_req.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/rd_req.c: In function =E2=80=98krb5_veri=
fy_ap_req2=E2=80=99:
=2E./../source4/heimdal/lib/krb5/rd_req.c:487:18: warning: comparison bet=
ween =E2=80=98krb5_keytype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum =
<anonymous>=E2=80=99 [-Wenum-compare]
  if (ac->keytype !=3D ETYPE_NULL)
                  ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1169/4194] Compiling source4/heimdal/lib/krb5/asn1_glue.c
[1170/4194] Compiling source4/heimdal/lib/krb5/rd_priv.c
[1171/4194] Compiling source4/heimdal/lib/krb5/appdefault.c
[1172/4194] Compiling source4/heimdal/lib/krb5/rd_rep.c
[1173/4194] Compiling source4/heimdal/lib/krb5/add_et_list.c
[1174/4194] Compiling source4/heimdal/lib/krb5/addr_families.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/addr_families.c:803:5: warning: missing =
initializer for field =E2=80=98mask_boundary=E2=80=99 of =E2=80=98struct =
addr_operations=E2=80=99 [-Wmissing-field-initializers]
     }
     ^
=2E./../source4/heimdal/lib/krb5/addr_families.c:54:11: note: =E2=80=98ma=
sk_boundary=E2=80=99 declared here
     int (*mask_boundary)(krb5_context, const krb5_address*, unsigned lon=
g,
           ^~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1175/4194] Compiling source4/heimdal/lib/krb5/rd_error.c
[1176/4194] Compiling source4/heimdal/lib/krb5/rd_cred.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/rd_cred.c: In function =E2=80=98krb5_rd_=
cred=E2=80=99:
=2E./../source4/heimdal/lib/krb5/rd_cred.c:99:29: warning: comparison bet=
ween =E2=80=98ENCTYPE {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <anon=
ymous>=E2=80=99 [-Wenum-compare]
     if (cred.enc_part.etype =3D=3D ETYPE_NULL) {
                             ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1177/4194] Compiling source4/heimdal/lib/krb5/prompter_posix.c
[1178/4194] Compiling source4/heimdal/lib/krb5/acache.c
[1179/4194] Compiling source4/heimdal/lib/krb5/pcache.c
[1180/4194] Compiling source4/heimdal/lib/krb5/prog_setup.c
[1181/4194] Compiling source4/heimdal/lib/krb5/pac.c
[1182/4194] Compiling source4/heimdal/lib/krb5/pkinit.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/pkinit.c: In function =E2=80=98find_cert=
=E2=80=99:
=2E./../source4/heimdal/lib/krb5/pkinit.c:186:2: warning: missing initial=
izer for field =E2=80=98oid=E2=80=99 of =E2=80=98struct certfind=E2=80=99=
 [-Wmissing-field-initializers]
  { "MobileMe EKU" },
  ^
=2E./../source4/heimdal/lib/krb5/pkinit.c:173:21: note: =E2=80=98oid=E2=80=
=99 declared here
     const heim_oid *oid;
                     ^~~
=2E./../source4/heimdal/lib/krb5/pkinit.c:187:2: warning: missing initial=
izer for field =E2=80=98oid=E2=80=99 of =E2=80=98struct certfind=E2=80=99=
 [-Wmissing-field-initializers]
  { "PKINIT EKU" },
  ^
=2E./../source4/heimdal/lib/krb5/pkinit.c:173:21: note: =E2=80=98oid=E2=80=
=99 declared here
     const heim_oid *oid;
                     ^~~
=2E./../source4/heimdal/lib/krb5/pkinit.c:188:2: warning: missing initial=
izer for field =E2=80=98oid=E2=80=99 of =E2=80=98struct certfind=E2=80=99=
 [-Wmissing-field-initializers]
  { "MS EKU" },
  ^
=2E./../source4/heimdal/lib/krb5/pkinit.c:173:21: note: =E2=80=98oid=E2=80=
=99 declared here
     const heim_oid *oid;
                     ^~~
=2E./../source4/heimdal/lib/krb5/pkinit.c:189:2: warning: missing initial=
izer for field =E2=80=98oid=E2=80=99 of =E2=80=98struct certfind=E2=80=99=
 [-Wmissing-field-initializers]
  { "any (or no)" }
  ^
=2E./../source4/heimdal/lib/krb5/pkinit.c:173:21: note: =E2=80=98oid=E2=80=
=99 declared here
     const heim_oid *oid;
                     ^~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1183/4194] Compiling source4/heimdal/lib/krb5/principal.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/principal.c:397:19: warning: =E2=80=98nq=
_chars=E2=80=99 defined but not used [-Wunused-const-variable=3D]
 static const char nq_chars[] =3D "    \\/@";
                   ^~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1184/4194] Compiling source4/heimdal/lib/krb5/padata.c
[1185/4194] Compiling source4/heimdal/lib/krb5/n-fold.c
[1186/4194] Compiling source4/heimdal/lib/krb5/mit_glue.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/mit_glue.c: In function =E2=80=98krb5_c_=
verify_checksum=E2=80=99:
=2E./../source4/heimdal/lib/krb5/mit_glue.c:79:37: warning: passing argum=
ent 6 of =E2=80=98krb5_verify_checksum=E2=80=99 discards =E2=80=98const=E2=
=80=99 qualifier from pointer target type [-Wdiscarded-qualifiers]
           data->data, data->length, cksum);
                                     ^~~~~
In file included from ../../source4/heimdal/lib/krb5/krb5.h:892:0,
                 from ../../source4/heimdal/lib/krb5/krb5_locl.h:175,
                 from ../../source4/heimdal/lib/krb5/mit_glue.c:34:
source4/heimdal/lib/krb5/krb5-protos.h:3778:1: note: expected =E2=80=98Ch=
ecksum * {aka struct Checksum *}=E2=80=99 but argument is of type =E2=80=98=
const krb5_checksum * {aka const struct Checksum *}=E2=80=99
 krb5_verify_checksum (
 ^~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1187/4194] Compiling source4/heimdal/lib/krb5/mk_req_ext.c
[1188/4194] Compiling source4/heimdal/lib/krb5/mk_req.c
[1189/4194] Compiling source4/heimdal/lib/krb5/mk_rep.c
[1190/4194] Compiling source4/heimdal/lib/krb5/mk_priv.c
[1191/4194] Compiling source4/heimdal/lib/krb5/mk_error.c
[1192/4194] Compiling source4/heimdal/lib/krb5/misc.c
[1193/4194] Compiling source4/heimdal/lib/krb5/log.c
[1194/4194] Compiling source4/heimdal/lib/krb5/mcache.c
[1195/4194] Compiling source4/heimdal/lib/krb5/krbhst.c
[1196/4194] Compiling source4/heimdal/lib/krb5/keytab_keyfile.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/keytab_keyfile.c:450:1: warning: missing=
 initializer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {ak=
a const struct krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal/lib/krb5/keytab_keyfile.c:34:=

=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1197/4194] Compiling source4/heimdal/lib/krb5/keytab_memory.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/keytab_memory.c:236:1: warning: missing =
initializer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {aka=
 const struct krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal/lib/krb5/keytab_memory.c:34:
=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1198/4194] Compiling source4/heimdal/lib/krb5/keytab_file.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/keytab_file.c:780:1: warning: missing in=
itializer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {aka c=
onst struct krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal/lib/krb5/keytab_file.c:34:
=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~
=2E./../source4/heimdal/lib/krb5/keytab_file.c:794:1: warning: missing in=
itializer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {aka c=
onst struct krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal/lib/krb5/keytab_file.c:34:
=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~
=2E./../source4/heimdal/lib/krb5/keytab_file.c:808:1: warning: missing in=
itializer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {aka c=
onst struct krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal/lib/krb5/keytab_file.c:34:
=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1199/4194] Compiling source4/heimdal/lib/krb5/keytab_any.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/krb5/keytab_any.c:261:1: warning: missing ini=
tializer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {aka co=
nst struct krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/krb5/krb5_locl.h:175:0,
                 from ../../source4/heimdal/lib/krb5/keytab_any.c:34:
=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1200/4194] Compiling source4/heimdal/lib/krb5/keyblock.c
[1201/4194] Compiling source4/heimdal/lib/krb5/keytab.c
[1202/4194] Linking bin/default/source4/heimdal_build/libkrb5-samba4.so
[1203/4194] Compiling lib/util/asn1.c
[1204/4194] Compiling lib/param/param_table.c
[1205/4194] Compiling lib/param/loadparm.c
[1206/4194] Compiling lib/param/util.c
[1207/4194] Compiling lib/dbwrap/dbwrap_local_open.c
[1208/4194] Compiling lib/dbwrap/dbwrap_tdb.c
[1209/4194] Linking bin/default/lib/util/libasn1util-samba4.so
[1210/4194] Linking bin/default/lib/param/libsamba-hostconfig.so
[1211/4194] Compiling lib/dbwrap/dbwrap.c
[1212/4194] Compiling lib/dbwrap/dbwrap_util.c
[1213/4194] Compiling lib/dbwrap/dbwrap_rbt.c
[1214/4194] Linking bin/default/lib/dbwrap/libdbwrap-samba4.so
[1215/4194] Compiling librpc/ndr/ndr_krb5pac.c
[1216/4194] Compiling bin/default/librpc/gen_ndr/ndr_krb5pac.c
[1217/4194] Compiling bin/default/source4/heimdal/lib/gssapi/asn1_gssapi_=
asn1.c
[1218/4194] Compiling bin/default/source4/heimdal/lib/gssapi/asn1_spnego_=
asn1.c
[1219/4194] Compiling source4/heimdal/lib/gssapi/krb5/store_cred.c
[1220/4194] Compiling source4/heimdal/lib/gssapi/krb5/release_cred.c
[1221/4194] Linking bin/default/librpc/libndr-krb5pac.so
[1222/4194] Compiling source4/heimdal/lib/gssapi/krb5/creds.c
[1223/4194] Compiling source4/heimdal/lib/gssapi/krb5/compat.c
[1224/4194] Compiling source4/heimdal/lib/gssapi/krb5/external.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:206:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:210:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:214:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:218:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:222:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:226:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:230:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:234:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:238:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:242:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:246:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:250:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:254:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:258:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:262:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/krb5/external.c:266:5: warning: missin=
g initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {a=
ka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     }
     ^
In file included from ../../source4/heimdal/lib/gssapi/krb5/gsskrb5_locl.=
h:44:0,
                 from ../../source4/heimdal/lib/gssapi/krb5/external.c:34=
:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1225/4194] Compiling source4/heimdal/lib/gssapi/krb5/release_buffer.c
[1226/4194] Compiling source4/heimdal/lib/gssapi/krb5/display_status.c
[1227/4194] Compiling source4/heimdal/lib/gssapi/krb5/sequence.c
[1228/4194] Compiling source4/heimdal/lib/gssapi/krb5/display_name.c
[1229/4194] Compiling source4/heimdal/lib/gssapi/krb5/encapsulate.c
[1230/4194] Compiling source4/heimdal/lib/gssapi/krb5/arcfour.c
[1231/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_add_cred.c
[1232/4194] Compiling source4/heimdal/lib/gssapi/krb5/8003.c
[1233/4194] Compiling source4/heimdal/lib/gssapi/krb5/cfx.c
[1234/4194] Compiling source4/heimdal/lib/gssapi/krb5/release_name.c
[1235/4194] Compiling source4/heimdal/lib/gssapi/krb5/wrap.c
[1236/4194] Compiling source4/heimdal/lib/gssapi/krb5/unwrap.c
[1237/4194] Compiling source4/heimdal/lib/gssapi/krb5/canonicalize_name.c=

[1238/4194] Compiling source4/heimdal/lib/gssapi/krb5/export_name.c
[1239/4194] Compiling source4/heimdal/lib/gssapi/krb5/compare_name.c
[1240/4194] Compiling source4/heimdal/lib/gssapi/krb5/import_name.c
[1241/4194] Compiling source4/heimdal/lib/gssapi/krb5/duplicate_name.c
[1242/4194] Compiling source4/heimdal/lib/gssapi/krb5/import_sec_context.=
c
[1243/4194] Compiling source4/heimdal/lib/gssapi/krb5/export_sec_context.=
c
[1244/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_sec_context=
_by_oid.c
[1245/4194] Compiling source4/heimdal/lib/gssapi/krb5/indicate_mechs.c
[1246/4194] Compiling source4/heimdal/lib/gssapi/krb5/acquire_cred.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/krb5/acquire_cred.c: In function =E2=80=
=98acquire_initiator_cred=E2=80=99:
=2E./../source4/heimdal/lib/gssapi/krb5/acquire_cred.c:189:30: warning: c=
ast discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Wcast-qual]
      gss_buffer_t password =3D (gss_buffer_t)credential_data;
                              ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1247/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_names_for_m=
ech.c
[1248/4194] Compiling source4/heimdal/lib/gssapi/krb5/init_sec_context.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/krb5/init_sec_context.c: In function =E2=
=80=98_gsskrb5_init_sec_context=E2=80=99:
=2E./../source4/heimdal/lib/gssapi/krb5/init_sec_context.c:957:5: warning=
: this statement may fall through [-Wimplicit-fallthrough=3D]
  if (ret !=3D GSS_S_COMPLETE)
     ^
=2E./../source4/heimdal/lib/gssapi/krb5/init_sec_context.c:960:5: note: h=
ere
     case INITIATOR_RESTART:
     ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1249/4194] Compiling source4/heimdal/lib/gssapi/krb5/delete_sec_context.=
c
[1250/4194] Compiling source4/heimdal/lib/gssapi/spnego/accept_sec_contex=
t.c
[1251/4194] Compiling source4/heimdal/lib/gssapi/krb5/copy_ccache.c
[1252/4194] Compiling source4/heimdal/lib/gssapi/spnego/external.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/spnego/external.c:70:5: warning: missi=
ng initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {=
aka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     },
     ^
In file included from ../../source4/heimdal/lib/gssapi/spnego/spnego_locl=
=2Eh:68:0,
                 from ../../source4/heimdal/lib/gssapi/spnego/external.c:=
33:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/spnego/external.c:74:5: warning: missi=
ng initializer for field =E2=80=98name=E2=80=99 of =E2=80=98gss_mo_desc {=
aka struct gss_mo_desc_struct}=E2=80=99 [-Wmissing-field-initializers]
     }
     ^
In file included from ../../source4/heimdal/lib/gssapi/spnego/spnego_locl=
=2Eh:68:0,
                 from ../../source4/heimdal/lib/gssapi/spnego/external.c:=
33:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:457:17: note: =E2=80=98n=
ame=E2=80=99 declared here
     const char *name;
                 ^~~~
=2E./../source4/heimdal/lib/gssapi/spnego/external.c:137:1: warning: miss=
ing initializer for field =E2=80=98gm_delete_name_attribute=E2=80=99 of =E2=
=80=98gssapi_mech_interface_desc {aka struct gssapi_mech_interface_desc}=E2=
=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/gssapi/spnego/spnego_locl=
=2Eh:68:0,
                 from ../../source4/heimdal/lib/gssapi/spnego/external.c:=
33:
=2E./../source4/heimdal/lib/gssapi/gssapi_mech.h:545:42: note: =E2=80=98g=
m_delete_name_attribute=E2=80=99 declared here
         _gss_delete_name_attribute_t    *gm_delete_name_attribute;
                                          ^~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1253/4194] Compiling source4/heimdal/lib/gssapi/spnego/context_stubs.c
[1254/4194] Compiling source4/heimdal/lib/gssapi/spnego/cred_stubs.c
[1255/4194] Compiling source4/heimdal/lib/gssapi/spnego/compat.c
[1256/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_mechs_for_n=
ame.c
[1257/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_release_oid.c
[1258/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_release_buffer.=
c
[1259/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_cred_by_mec=
h.c
[1260/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_display_status.=
c
[1261/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_display_name.c
[1262/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_duplicate_oid.c=

[1263/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_verify.c
[1264/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_wrap_size_limit=
=2Ec
[1265/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_names.c
[1266/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_cred_by_oid=
=2Ec
[1267/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_mechs_f=
or_name.c
[1268/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_names_f=
or_mech.c
[1269/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_canonicalize_na=
me.c
[1270/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_sec_con=
text_by_oid.c
[1271/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_cred.c
[1272/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_decapsulate_tok=
en.c
[1273/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_cred_by=
_oid.c
[1274/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_create_empty_oi=
d_set.c
[1275/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_release_oid_set=
=2Ec
[1276/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_compare_name.c
[1277/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_add_oid_set_mem=
ber.c
[1278/4194] Compiling source4/heimdal/lib/gssapi/krb5/add_cred.c
[1279/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_cred.c
[1280/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_aeap.c
[1281/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_buffer_set.c
[1282/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_process_context=
_token.c
[1283/4194] Compiling source4/heimdal/lib/gssapi/krb5/inquire_context.c
[1284/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_mech_switch.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c: In function =E2=
=80=98_gss_load_mech=E2=80=99:
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:237:7: warning:=
 unused variable =E2=80=98found=E2=80=99 [-Wunused-variable]
  int  found;
       ^~~~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:236:15: warning=
: unused variable =E2=80=98mech_oid=E2=80=99 [-Wunused-variable]
  gss_OID_desc mech_oid;
               ^~~~~~~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:235:9: warning:=
 unused variable =E2=80=98so=E2=80=99 [-Wunused-variable]
  void  *so;
         ^~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:234:27: warning=
: unused variable =E2=80=98m=E2=80=99 [-Wunused-variable]
  struct _gss_mech_switch *m;
                           ^
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:233:28: warning=
: unused variable =E2=80=98kobj=E2=80=99 [-Wunused-variable]
  char  *name, *oid, *lib, *kobj;
                            ^~~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:233:22: warning=
: unused variable =E2=80=98lib=E2=80=99 [-Wunused-variable]
  char  *name, *oid, *lib, *kobj;
                      ^~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:233:16: warning=
: unused variable =E2=80=98oid=E2=80=99 [-Wunused-variable]
  char  *name, *oid, *lib, *kobj;
                ^~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:233:9: warning:=
 unused variable =E2=80=98name=E2=80=99 [-Wunused-variable]
  char  *name, *oid, *lib, *kobj;
         ^~~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:232:9: warning:=
 unused variable =E2=80=98p=E2=80=99 [-Wunused-variable]
  char  *p;
         ^
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:231:8: warning:=
 unused variable =E2=80=98buf=E2=80=99 [-Wunused-variable]
  char  buf[256];
        ^~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:230:9: warning:=
 unused variable =E2=80=98fp=E2=80=99 [-Wunused-variable]
  FILE  *fp;
         ^~
At top level:
=2E./../source4/heimdal/lib/gssapi/mech/gss_mech_switch.c:45:1: warning: =
=E2=80=98_gss_string_to_oid=E2=80=99 defined but not used [-Wunused-funct=
ion]
 _gss_string_to_oid(const char* s, gss_OID oid)
 ^~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1285/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_krb5.c
[1286/4194] Compiling source4/heimdal/lib/gssapi/mech/context.c
[1287/4194] Compiling source4/heimdal/lib/gssapi/krb5/authorize_localname=
=2Ec
[1288/4194] Compiling source4/heimdal/lib/gssapi/krb5/get_mic.c
[1289/4194] Compiling source4/heimdal/lib/gssapi/krb5/pname_to_uid.c
[1290/4194] Compiling source4/heimdal/lib/gssapi/krb5/prf.c
[1291/4194] Compiling source4/heimdal/lib/gssapi/krb5/aeap.c
[1292/4194] Compiling source4/heimdal/lib/gssapi/krb5/set_sec_context_opt=
ion.c
[1293/4194] Compiling source4/heimdal/lib/gssapi/krb5/process_context_tok=
en.c
[1294/4194] Compiling source4/heimdal/lib/gssapi/krb5/accept_sec_context.=
c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/krb5/accept_sec_context.c: In function=
 =E2=80=98_gsskrb5i_is_cfx=E2=80=99:
=2E./../source4/heimdal/lib/gssapi/krb5/accept_sec_context.c:107:21: warn=
ing: variable =E2=80=98ret=E2=80=99 set but not used [-Wunused-but-set-va=
riable]
     krb5_error_code ret;
                     ^~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1295/4194] Compiling source4/heimdal/lib/gssapi/krb5/verify_mic.c
[1296/4194] Compiling source4/heimdal/lib/gssapi/krb5/set_cred_option.c
[1297/4194] Compiling source4/heimdal/lib/gssapi/krb5/decapsulate.c
[1298/4194] Compiling source4/heimdal/lib/gssapi/krb5/address_to_krb5addr=
=2Ec
[1299/4194] Compiling source4/heimdal/lib/gssapi/krb5/init.c
[1300/4194] Compiling source4/heimdal/lib/gssapi/krb5/context_time.c
[1301/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_release_name.c
[1302/4194] Compiling source4/heimdal_build/gssapi-glue.c
[1303/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_pseudo_random.c=

[1304/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_duplicate_name.=
c
[1305/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_import_name.c
[1306/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_cred.c
[1307/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_export_sec_cont=
ext.c
[1308/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_unwrap.c
[1309/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_wrap.c
[1310/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_context_time.c
[1311/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_encapsulate_tok=
en.c
[1312/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_get_mic.c
[1313/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_import_sec_cont=
ext.c
[1314/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_oid_to_str.c
[1315/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_oid_equal.c
[1316/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_oid.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/mech/gss_oid.c:107:72: warning: initia=
lization discards =E2=80=98const=E2=80=99 qualifier from pointer target t=
ype [-Wdiscarded-qualifiers]
 gss_OID_desc GSSAPI_LIB_VARIABLE __gss_c_cred_password_oid_desc =3D { 7,=
 "\x2a\x85\x70\x2b\x0d\x81\x48" };
                                                                        ^=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/gssapi/mech/gss_oid.c:110:75: warning: initia=
lization discards =E2=80=98const=E2=80=99 qualifier from pointer target t=
ype [-Wdiscarded-qualifiers]
 gss_OID_desc GSSAPI_LIB_VARIABLE __gss_c_cred_certificate_oid_desc =3D {=
 7, "\x2a\x85\x70\x2b\x0d\x81\x49" };
                                                                         =
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1317/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_init_sec_contex=
t.c
[1318/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_sign.c
[1319/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_utils.c
[1320/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_indicate_mechs.=
c
[1321/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_delete_sec_cont=
ext.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/gssapi/mech/gss_delete_sec_context.c: In func=
tion =E2=80=98gss_delete_sec_context=E2=80=99:
=2E./../source4/heimdal/lib/gssapi/mech/gss_delete_sec_context.c:36:12: w=
arning: variable =E2=80=98major_status=E2=80=99 set but not used [-Wunuse=
d-but-set-variable]
  OM_uint32 major_status;
            ^~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1322/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_verify_mic.c
[1323/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_accept_sec_cont=
ext.c
[1324/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_cred_by=
_mech.c
[1325/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_acquire_cred.c
[1326/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_unseal.c
[1327/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_seal.c
[1328/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_set_sec_context=
_option.c
[1329/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_export_name.c
[1330/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_test_oid_set_me=
mber.c
[1331/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_release_cred.c
[1332/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_set_cred_option=
=2Ec
[1333/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_inquire_context=
=2Ec
[1334/4194] Compiling source4/heimdal/lib/gssapi/mech/gss_mo.c
[1335/4194] Compiling source4/heimdal/lib/gssapi/spnego/init_sec_context.=
c
[1336/4194] Linking bin/default/source4/heimdal_build/libgssapi-samba4.so=

[1337/4194] Compiling lib/util/msghdr.c
[1338/4194] Compiling lib/socket/interfaces.c
[1339/4194] Compiling source4/lib/events/tevent_s4.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/lib/events/tevent_s4.c: In function =E2=80=98s4_event_con=
text_init=E2=80=99:
=2E./../source4/lib/events/tevent_s4.c:37:3: warning: =E2=80=98tevent_loo=
p_allow_nesting=E2=80=99 is deprecated [-Wdeprecated-declarations]
   tevent_loop_allow_nesting(ev);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/lib/events/events.h:3:0,
                 from ../../source4/lib/events/tevent_s4.c:21:
=2E./../lib/tevent/tevent.h:2085:6: note: declared here
 void tevent_loop_allow_nesting(struct tevent_context *ev) _DEPRECATED_;
      ^~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1340/4194] Compiling lib/compression/lzxpress.c
[1341/4194] Compiling bin/default/librpc/gen_ndr/ndr_auth.c
[1342/4194] Compiling librpc/ndr/ndr_auth.c
[1343/4194] Linking bin/default/lib/util/libmsghdr-samba4.so
[1344/4194] Linking bin/default/lib/socket/libinterfaces-samba4.so
[1345/4194] Linking bin/default/source4/lib/events/libevents-samba4.so
[1346/4194] Compiling bin/default/librpc/gen_ndr/ndr_named_pipe_auth.c
[1347/4194] Compiling bin/default/librpc/gen_ndr/ndr_dnsserver.c
[1348/4194] Compiling librpc/ndr/ndr_dnsserver.c
[1349/4194] Compiling bin/default/librpc/gen_ndr/ndr_unixinfo.c
[1350/4194] Compiling bin/default/librpc/gen_ndr/ndr_epmapper.c
[1351/4194] Compiling bin/default/librpc/gen_ndr/ndr_mgmt.c
[1352/4194] Compiling bin/default/librpc/gen_ndr/ndr_orpc.c
[1353/4194] Compiling librpc/ndr/ndr_orpc.c
[1354/4194] Compiling bin/default/librpc/gen_ndr/ndr_dcom.c
[1355/4194] Compiling bin/default/librpc/gen_ndr/ndr_idmap.c
[1356/4194] Compiling librpc/ndr/ndr_ntlmssp.c
[1357/4194] Compiling bin/default/librpc/gen_ndr/ndr_ntlmssp.c
[1358/4194] Compiling librpc/ndr/ndr_negoex.c
[1359/4194] Compiling bin/default/librpc/gen_ndr/ndr_negoex.c
[1360/4194] Compiling librpc/ndr/ndr_ntprinting.c
[1361/4194] Compiling bin/default/librpc/gen_ndr/ndr_ntprinting.c
[1362/4194] Compiling librpc/ndr/ndr_compression.c
[1363/4194] Compiling bin/default/librpc/gen_ndr/ndr_fsrvp.c
[1364/4194] Compiling bin/default/librpc/gen_ndr/ndr_witness.c
[1365/4194] Compiling librpc/ndr/ndr_witness.c
[1366/4194] Compiling bin/default/librpc/gen_ndr/ndr_mdssvc.c
[1367/4194] Compiling librpc/ndr/ndr_drsuapi.c
[1368/4194] Compiling bin/default/librpc/gen_ndr/ndr_drsuapi.c
[1369/4194] Compiling librpc/ndr/ndr_drsblobs.c
[1370/4194] Compiling bin/default/librpc/gen_ndr/ndr_drsblobs.c
[1371/4194] Compiling librpc/ndr/ndr_xattr.c
[1372/4194] Compiling bin/default/librpc/gen_ndr/ndr_xattr.c
[1373/4194] Compiling bin/default/librpc/gen_ndr/ndr_smb2_lease_struct.c
[1374/4194] Compiling bin/default/librpc/gen_ndr/ndr_schannel.c
[1375/4194] Compiling librpc/ndr/ndr_schannel.c
[1376/4194] Compiling bin/default/librpc/ndr-samba.empty.c
[1377/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_open_files.c=

[1378/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_smbXsrv.c
[1379/4194] Linking bin/default/librpc/libndr-samba-samba4.so
[1380/4194] Compiling lib/ldb/ldb_map/ldb_map.c
[1381/4194] Compiling lib/ldb/ldb_map/ldb_map_inbound.c
[1382/4194] Compiling lib/ldb/common/qsort.c
[1383/4194] Compiling lib/ldb/common/ldb_controls.c
[1384/4194] Compiling lib/ldb/common/attrib_handlers.c
[1385/4194] Compiling lib/ldb/common/ldb_attributes.c
[1386/4194] Compiling lib/ldb/common/ldb_pack.c
[1387/4194] Compiling lib/ldb/common/ldb_options.c
[1388/4194] Compiling lib/ldb/common/ldb_match.c
[1389/4194] Compiling lib/ldb/common/ldb_dn.c
[1390/4194] Compiling lib/ldb/common/ldb_debug.c
[1391/4194] Compiling lib/ldb/common/ldb_utf8.c
[1392/4194] Compiling lib/ldb/common/ldb_msg.c
[1393/4194] Compiling lib/ldb/common/ldb_parse.c
[1394/4194] Compiling lib/ldb/common/ldb_ldif.c
[1395/4194] Compiling lib/ldb/common/ldb_modules.c
[1396/4194] Compiling lib/ldb/ldb_map/ldb_map_outbound.c
[1397/4194] Compiling lib/ldb/common/ldb.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../lib/ldb/common/ldb.c: In function =E2=80=98ldb_init=E2=80=99:
=2E./../lib/ldb/common/ldb.c:120:3: warning: =E2=80=98tevent_loop_allow_n=
esting=E2=80=99 is deprecated [-Wdeprecated-declarations]
   tevent_loop_allow_nesting(ev_ctx);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../lib/ldb/include/ldb.h:51:0,
                 from ../../lib/ldb/include/ldb_private.h:43,
                 from ../../lib/ldb/common/ldb.c:36:
=2E./../lib/tevent/tevent.h:2085:6: note: declared here
 void tevent_loop_allow_nesting(struct tevent_context *ev) _DEPRECATED_;
      ^~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/ldb/common/ldb.c: In function =E2=80=98ldb_handle_new=E2=80=99=
:
=2E./../lib/ldb/common/ldb.c:742:3: warning: =E2=80=98tevent_loop_allow_n=
esting=E2=80=99 is deprecated [-Wdeprecated-declarations]
   tevent_loop_allow_nesting(h->event_context);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../lib/ldb/include/ldb.h:51:0,
                 from ../../lib/ldb/include/ldb_private.h:43,
                 from ../../lib/ldb/common/ldb.c:36:
=2E./../lib/tevent/tevent.h:2085:6: note: declared here
 void tevent_loop_allow_nesting(struct tevent_context *ev) _DEPRECATED_;
      ^~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1398/4194] Linking bin/default/lib/ldb/libldb.so
[1399/4194] Compiling lib/krb5_wrap/gss_samba.c
[1400/4194] Compiling lib/krb5_wrap/enctype_convert.c
[1401/4194] Compiling lib/krb5_wrap/keytab_util.c
[1402/4194] Compiling lib/krb5_wrap/krb5_samba.c
[1403/4194] Compiling source4/cluster/local.c
[1404/4194] Compiling source4/cluster/cluster.c
[1405/4194] Linking bin/default/lib/krb5_wrap/libkrb5samba-samba4.so
[1406/4194] Compiling lib/pthreadpool/pthreadpool_pipe.c
[1407/4194] Compiling lib/pthreadpool/pthreadpool.c
[1408/4194] Compiling lib/pthreadpool/pthreadpool_tevent.c
[1409/4194] Linking bin/default/source4/cluster/libcluster-samba4.so
[1410/4194] Compiling lib/util/server_id_db.c
[1411/4194] Compiling source3/lib/messages_dgm_ref.c
[1412/4194] Compiling source3/lib/messages_dgm.c
[1413/4194] Linking bin/default/source3/libmessages-dgm-samba4.so
[1414/4194] Compiling source3/lib/messages_util.c
[1415/4194] Compiling source4/lib/socket/socket_ip.c
[1416/4194] Linking bin/default/lib/util/libserver-id-db-samba4.so
[1417/4194] Compiling source4/lib/socket/socket_unix.c
[1418/4194] Compiling source4/lib/socket/connect.c
[1419/4194] Compiling source4/lib/socket/connect_multi.c
[1420/4194] Linking bin/default/source3/libmessages-util-samba4.so
[1421/4194] Compiling source4/lib/socket/access.c
[1422/4194] Compiling source4/lib/socket/socket.c
[1423/4194] Compiling lib/util/access.c
[1424/4194] Compiling lib/tsocket/tsocket_bsd.c
[1425/4194] Compiling lib/tsocket/tsocket_helpers.c
[1426/4194] Compiling lib/tsocket/tsocket.c
[1427/4194] Compiling source4/libcli/composite/composite.c
[1428/4194] Compiling source4/libcli/resolve/resolve.c
[1429/4194] Compiling bin/default/lib/samba-sockets.empty.c
[1430/4194] Linking bin/default/lib/libsamba-sockets-samba4.so
[1431/4194] Compiling bin/default/libcli/auth/cliauth.empty.c
[1432/4194] Compiling libcli/auth/msrpc_parse.c
[1433/4194] Compiling libcli/auth/ntlm_check.c
[1434/4194] Compiling libcli/auth/smbdes.c
[1435/4194] Compiling libcli/auth/smbencrypt.c
[1436/4194] Compiling libcli/auth/session.c
[1437/4194] Compiling libcli/auth/credentials.c
[1438/4194] Compiling libcli/auth/schannel_state_tdb.c
[1439/4194] Compiling libcli/auth/pam_errors.c
[1440/4194] Compiling libcli/auth/spnego_parse.c
[1441/4194] Compiling libcli/lsarpc/util_lsarpc.c
[1442/4194] Linking bin/default/libcli/auth/libcliauth-samba4.so
[1443/4194] Compiling libcli/ldap/ldap_ndr.c
[1444/4194] Compiling libcli/ldap/ldap_message.c
[1445/4194] Compiling libds/common/flag_mapping.c
[1446/4194] Compiling source4/lib/messaging/messaging_send.c
[1447/4194] Compiling lib/util/unix_privs.c
[1448/4194] Compiling source4/dsdb/common/util_links.c
[1449/4194] Linking bin/default/libcli/ldap/libcli-ldap-common-samba4.so
[1450/4194] Compiling source4/dsdb/common/dsdb_access.c
[1451/4194] Linking bin/default/libds/common/libflag-mapping-samba4.so
[1452/4194] Linking bin/default/source4/lib/messaging/libMESSAGING-SEND-s=
amba4.so
[1453/4194] Compiling source4/dsdb/common/dsdb_dn.c
[1454/4194] Compiling source4/dsdb/common/util_samr.c
[1455/4194] Compiling source4/dsdb/common/util_groups.c
[1456/4194] Compiling source4/dsdb/common/util_trusts.c
[1457/4194] Compiling source4/dsdb/common/util.c
[1458/4194] Compiling lib/util/util_ldb.c
[1459/4194] Compiling lib/util/util_runcmd.c
[1460/4194] Linking bin/default/source4/dsdb/libsamdb-common-samba4.so
[1461/4194] Compiling lib/audit_logging/audit_logging.c
[1462/4194] Compiling auth/auth_util.c
[1463/4194] Compiling auth/auth_log.c
[1464/4194] Compiling auth/wbc_auth_util.c
[1465/4194] Compiling auth/auth_sam_reply.c
[1466/4194] Compiling lib/util/util_str_escape.c
[1467/4194] Linking bin/default/auth/libcommon-auth-samba4.so
[1468/4194] Compiling source4/dsdb/schema/schema_prefixmap.c
[1469/4194] Compiling source4/dsdb/schema/schema_inferiors.c
[1470/4194] Compiling source4/dsdb/schema/schema_convert_to_ol.c
[1471/4194] Compiling source4/dsdb/schema/schema_description.c
[1472/4194] Compiling source4/dsdb/schema/schema_syntax.c
[1473/4194] Compiling source4/dsdb/schema/schema_query.c
[1474/4194] Compiling source4/dsdb/schema/schema_info_attr.c
[1475/4194] Compiling source4/dsdb/schema/schema_set.c
[1476/4194] Compiling source4/dsdb/schema/schema_init.c
[1477/4194] Compiling source4/dsdb/schema/dsdb_dn.c
[1478/4194] Compiling source4/dsdb/schema/schema_filtered.c
[1479/4194] Compiling lib/ldb-samba/ldif_handlers.c
[1480/4194] Compiling lib/ldb-samba/ldb_matching_rules.c
[1481/4194] Compiling lib/ldb-samba/ldb_wrap.c
[1482/4194] Linking bin/default/lib/ldb-samba/libldbsamba-samba4.so
[1483/4194] Compiling source4/auth/kerberos/krb5_init_context.c
[1484/4194] Compiling source4/auth/kerberos/kerberos_pac.c
[1485/4194] Compiling auth/kerberos/gssapi_helper.c
[1486/4194] Compiling auth/kerberos/kerberos_pac.c
[1487/4194] Compiling auth/kerberos/gssapi_pac.c
[1488/4194] Compiling source4/lib/tls/tls_tstream.c
[1489/4194] Compiling source4/lib/tls/tlscert.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/lib/tls/tlscert.c: In function =E2=80=98tls_cert_generate=
=E2=80=99:
=2E./../source4/lib/tls/tlscert.c:42:2: warning: =E2=80=98gnutls_x509_crt=
=E2=80=99 is deprecated [-Wdeprecated-declarations]
  gnutls_x509_crt cacrt, crt;
  ^~~~~~~~~~~~~~~
=2E./../source4/lib/tls/tlscert.c:42:2: warning: =E2=80=98gnutls_x509_crt=
=E2=80=99 is deprecated [-Wdeprecated-declarations]
=2E./../source4/lib/tls/tlscert.c:43:2: warning: =E2=80=98gnutls_x509_pri=
vkey=E2=80=99 is deprecated [-Wdeprecated-declarations]
  gnutls_x509_privkey key, cakey;
  ^~~~~~~~~~~~~~~~~~~
=2E./../source4/lib/tls/tlscert.c:43:2: warning: =E2=80=98gnutls_x509_pri=
vkey=E2=80=99 is deprecated [-Wdeprecated-declarations]


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1490/4194] Compiling source4/lib/stream/packet.c
[1491/4194] Linking bin/default/source4/auth/kerberos/libauthkrb5-samba4.=
so
[1492/4194] Compiling source4/param/secrets.c
[1493/4194] Compiling source4/auth/kerberos/kerberos_util.c
[1494/4194] Compiling source4/auth/kerberos/srv_keytab.c
[1495/4194] Compiling auth/credentials/credentials.c
[1496/4194] Compiling auth/credentials/credentials_krb5.c
[1497/4194] Compiling auth/credentials/credentials_secrets.c
[1498/4194] Compiling auth/credentials/credentials_ntlm.c
[1499/4194] Linking bin/default/auth/credentials/libsamba-credentials.so
[1500/4194] Compiling nsswitch/wb_common.c
[1501/4194] Compiling source4/dsdb/repl/replicated_objects.c
[1502/4194] Compiling source4/dsdb/samdb/cracknames.c
[1503/4194] Compiling source4/dsdb/samdb/samdb_privilege.c
[1504/4194] Compiling source4/dsdb/samdb/samdb.c
[1505/4194] Compiling source4/auth/session.c
[1506/4194] Linking bin/default/nsswitch/libwinbind-client-samba4.so
[1507/4194] Compiling source4/auth/system_session.c
[1508/4194] Compiling source4/auth/sam.c
[1509/4194] Compiling libcli/drsuapi/repl_decrypt.c
[1510/4194] Linking bin/default/source4/dsdb/libsamdb.so
[1511/4194] Compiling lib/util/modules.c
[1512/4194] Compiling nsswitch/libwbclient/wbc_util.c
[1513/4194] Compiling nsswitch/libwbclient/wbc_sid.c
[1514/4194] Compiling nsswitch/libwbclient/wbc_pwd.c
[1515/4194] Compiling nsswitch/libwbclient/wbc_pam.c
[1516/4194] Compiling nsswitch/libwbclient/wbclient.c
[1517/4194] Linking bin/default/lib/util/libsamba-modules-samba4.so
[1518/4194] Compiling nsswitch/libwbclient/wbc_guid.c
[1519/4194] Compiling nsswitch/libwbclient/wbc_idmap.c
[1520/4194] Linking bin/default/nsswitch/libwbclient/libwbclient.so
[1521/4194] Compiling source4/auth/gensec/gensec_tstream.c
[1522/4194] Compiling source4/auth/gensec/gensec_gssapi.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/auth/gensec/gensec_gssapi.c: In function =E2=80=98gensec_=
gssapi_update_internal=E2=80=99:
=2E./../source4/auth/gensec/gensec_gssapi.c:476:4: warning: =E2=80=98gssk=
rb5_set_send_to_kdc=E2=80=99 is deprecated [-Wdeprecated-declarations]
    min_stat =3D gsskrb5_set_send_to_kdc(&send_to_kdc);
    ^~~~~~~~
In file included from ../../lib/replace/system/gssapi.h:43:0,
                 from ../../source4/auth/gensec/gensec_gssapi.c:29:
=2E./../source4/heimdal/lib/gssapi/gssapi/gssapi_krb5.h:123:1: note: decl=
ared here
 gsskrb5_set_send_to_kdc(struct gsskrb5_send_to_kdc *)
 ^~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/auth/gensec/gensec_gssapi.c:629:4: warning: =E2=80=98gssk=
rb5_set_send_to_kdc=E2=80=99 is deprecated [-Wdeprecated-declarations]
    ret =3D gsskrb5_set_send_to_kdc(&send_to_kdc);
    ^~~
In file included from ../../lib/replace/system/gssapi.h:43:0,
                 from ../../source4/auth/gensec/gensec_gssapi.c:29:
=2E./../source4/heimdal/lib/gssapi/gssapi/gssapi_krb5.h:123:1: note: decl=
ared here
 gsskrb5_set_send_to_kdc(struct gsskrb5_send_to_kdc *)
 ^~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1523/4194] Compiling auth/gensec/gensec_util.c
[1524/4194] Compiling auth/gensec/gensec_start.c
[1525/4194] Compiling auth/gensec/gensec.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../auth/gensec/gensec.c: In function =E2=80=98gensec_update=E2=80=99=
:
=2E./../auth/gensec/gensec.c:380:2: warning: =E2=80=98tevent_loop_allow_n=
esting=E2=80=99 is deprecated [-Wdeprecated-declarations]
  tevent_loop_allow_nesting(ev);
  ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../auth/gensec/gensec.c:26:0:
=2E./../lib/tevent/tevent.h:2085:6: note: declared here
 void tevent_loop_allow_nesting(struct tevent_context *ev) _DEPRECATED_;
      ^~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1526/4194] Compiling auth/gensec/spnego.c
[1527/4194] Compiling auth/gensec/schannel.c
[1528/4194] Compiling auth/gensec/ncalrpc.c
[1529/4194] Compiling auth/gensec/external.c
[1530/4194] Compiling auth/ntlmssp/gensec_ntlmssp_server.c
[1531/4194] Compiling auth/ntlmssp/ntlmssp_sign.c
[1532/4194] Compiling auth/ntlmssp/ntlmssp_server.c
[1533/4194] Compiling auth/ntlmssp/ntlmssp_client.c
[1534/4194] Compiling auth/ntlmssp/ntlmssp_ndr.c
[1535/4194] Compiling auth/ntlmssp/ntlmssp_util.c
[1536/4194] Compiling auth/ntlmssp/ntlmssp.c
[1537/4194] Compiling auth/ntlmssp/gensec_ntlmssp.c
[1538/4194] Compiling bin/default/auth/ntlmssp/gensec_ntlmssp.empty.c
[1539/4194] Compiling source4/lib/http/gensec/basic.c
[1540/4194] Compiling source4/lib/http/gensec/generic.c
[1541/4194] Linking bin/default/auth/gensec/libgensec-samba4.so
[1542/4194] Compiling lib/async_req/async_sock.c
[1543/4194] Compiling libcli/smb/read_smb.c
[1544/4194] Compiling source3/lib/per_thread_cwd.c
[1545/4194] Compiling source3/lib/cbuf.c
[1546/4194] Compiling source3/lib/file_id.c
[1547/4194] Compiling source3/lib/namearray.c
[1548/4194] Linking bin/default/libcli/smb/libsmb-transport-samba4.so
[1549/4194] Compiling source3/lib/util_malloc.c
[1550/4194] Compiling source3/lib/util_str.c
[1551/4194] Compiling source3/lib/util_sec.c
[1552/4194] Compiling source3/lib/adt_tree.c
[1553/4194] Linking bin/default/source3/libsamba3-util-samba4.so
[1554/4194] Compiling libcli/dns/dns.c
[1555/4194] Compiling libcli/dns/resolvconf.c
[1556/4194] Compiling libcli/smb/smb2cli_query_directory.c
[1557/4194] Compiling libcli/smb/smb2cli_notify.c
[1558/4194] Compiling libcli/smb/smb2cli_query_info.c
[1559/4194] Compiling libcli/smb/smb2cli_set_info.c
[1560/4194] Linking bin/default/libcli/dns/libclidns-samba4.so
[1561/4194] Compiling libcli/smb/smb2cli_write.c
[1562/4194] Compiling libcli/smb/smb2cli_read.c
[1563/4194] Compiling libcli/smb/smb2cli_close.c
[1564/4194] Compiling libcli/smb/smb2cli_create.c
[1565/4194] Compiling libcli/smb/smb2cli_tcon.c
[1566/4194] Compiling libcli/smb/smb2cli_session.c
[1567/4194] Compiling libcli/smb/smb1cli_read.c
[1568/4194] Compiling libcli/smb/smb1cli_write.c
[1569/4194] Compiling libcli/smb/smb1cli_close.c
[1570/4194] Compiling libcli/smb/smb1cli_session.c
[1571/4194] Compiling libcli/smb/smb1cli_create.c
[1572/4194] Compiling libcli/smb/smb1cli_echo.c
[1573/4194] Compiling libcli/smb/smb1cli_trans.c
[1574/4194] Compiling libcli/smb/smbXcli_base.c
[1575/4194] Compiling libcli/smb/util.c
[1576/4194] Compiling libcli/smb/smb2_lease.c
[1577/4194] Compiling libcli/smb/smb2_signing.c
[1578/4194] Compiling libcli/smb/smb2_create_blob.c
[1579/4194] Compiling libcli/smb/smb2_negotiate_context.c
[1580/4194] Compiling libcli/smb/smb_seal.c
[1581/4194] Compiling libcli/smb/smb_signing.c
[1582/4194] Compiling libcli/smb/smb2cli_flush.c
[1583/4194] Compiling libcli/smb/tstream_smbXcli_np.c
[1584/4194] Compiling libcli/smb/smb2cli_echo.c
[1585/4194] Compiling libcli/smb/smb2cli_ioctl.c
[1586/4194] Linking bin/default/libcli/smb/libcli-smb-common-samba4.so
[1587/4194] Compiling lib/util/talloc_report.c
[1588/4194] Compiling libcli/registry/util_reg.c
[1589/4194] Compiling source3/lib/ctdb_dummy.c
[1590/4194] Compiling source3/lib/cluster_support.c
[1591/4194] Compiling source3/lib/smbd_shim.c
[1592/4194] Compiling source3/lib/fstring.c
[1593/4194] Linking bin/default/lib/util/libtalloc-report-samba4.so
[1594/4194] Linking bin/default/libcli/registry/libutil-reg-samba4.so
[1595/4194] Linking bin/default/source3/libsamba-cluster-support-samba4.s=
o
[1596/4194] Compiling source3/lib/charcnv.c
[1597/4194] Linking bin/default/source3/libsmbd-shim-samba4.so
[1598/4194] Linking bin/default/source3/libCHARSET3-samba4.so
[1599/4194] Compiling libcli/nbt/lmhosts.c
[1600/4194] Compiling libcli/dns/dns_lookup.c
[1601/4194] Compiling lib/addns/error.c
[1602/4194] Compiling lib/addns/dnsmarshall.c
[1603/4194] Compiling lib/addns/dnssock.c
[1604/4194] Compiling lib/addns/dnsgss.c
[1605/4194] Compiling lib/addns/dnsutils.c
[1606/4194] Compiling lib/addns/dnsrecord.c
[1607/4194] Compiling lib/addns/dnsquery.c
[1608/4194] Linking bin/default/lib/addns/libaddns-samba4.so
[1609/4194] Compiling source4/lib/socket/interface.c
[1610/4194] Compiling libcli/nbt/nbtsocket.c
[1611/4194] Compiling libcli/nbt/namerelease.c
[1612/4194] Compiling libcli/nbt/namerefresh.c
[1613/4194] Compiling libcli/nbt/nameregister.c
[1614/4194] Compiling libcli/nbt/namequery.c
[1615/4194] Linking bin/default/source4/lib/socket/libnetif-samba4.so
[1616/4194] Linking bin/default/libcli/nbt/libcli-nbt-samba4.so
[1617/4194] Compiling lib/util/util_pw.c
[1618/4194] Compiling bin/default/librpc/gen_ndr/ndr_messaging.c
[1619/4194] Compiling lib/smbconf/smbconf_util.c
[1620/4194] Compiling lib/smbconf/smbconf_txt.c
[1621/4194] Compiling lib/smbconf/smbconf.c
[1622/4194] Compiling source3/registry/reg_util_internal.c
[1623/4194] Compiling source3/registry/reg_init_basic.c
[1624/4194] Compiling source3/lib/srprs.c
[1625/4194] Compiling source3/registry/reg_backend_db.c
[1626/4194] Compiling source3/registry/reg_parse_internal.c
[1627/4194] Compiling source3/lib/util_nttoken.c
[1628/4194] Compiling source3/registry/reg_objects.c
[1629/4194] Compiling source3/registry/reg_dispatcher.c
[1630/4194] Compiling source3/registry/reg_cachehook.c
[1631/4194] Compiling source3/registry/reg_api.c
[1632/4194] Compiling source3/registry/reg_api_util.c
[1633/4194] Compiling source3/registry/reg_util_token.c
[1634/4194] Compiling source3/registry/reg_backend_smbconf.c
[1635/4194] Compiling source3/registry/reg_init_smbconf.c
[1636/4194] Compiling source3/lib/util_procid.c
[1637/4194] Compiling source3/lib/util_transfer_file.c
[1638/4194] Compiling source3/lib/util_tsock.c
[1639/4194] Compiling source3/lib/util_sock.c
[1640/4194] Compiling source3/lib/util_path.c
[1641/4194] Compiling source3/lib/util.c
[1642/4194] Compiling source3/lib/util_specialsids.c
[1643/4194] Compiling source3/lib/util_file.c
[1644/4194] Compiling source3/lib/util_sid.c
[1645/4194] Compiling source3/lib/time.c
[1646/4194] Compiling source3/lib/recvfile.c
[1647/4194] Compiling source3/lib/system.c
[1648/4194] Compiling source3/lib/sendfile.c
[1649/4194] Compiling source3/lib/g_lock.c
[1650/4194] Compiling source3/lib/dbwrap/dbwrap_open.c
[1651/4194] Compiling source3/lib/dbwrap/dbwrap_watch.c
[1652/4194] Compiling source3/lib/idmap_cache.c
[1653/4194] Compiling source3/lib/background.c
[1654/4194] Compiling source3/lib/util_ea.c
[1655/4194] Compiling source3/lib/namemap_cache.c
[1656/4194] Compiling source3/libads/krb5_errs.c
[1657/4194] Compiling source3/lib/tevent_wait.c
[1658/4194] Compiling source3/lib/audit.c
[1659/4194] Compiling source3/lib/util_event.c
[1660/4194] Compiling source3/lib/ldap_escape.c
[1661/4194] Compiling source3/lib/system_smbd.c
[1662/4194] Compiling source3/lib/global_contexts.c
[1663/4194] Compiling source3/lib/server_prefork.c
[1664/4194] Compiling source3/lib/server_prefork_util.c
[1665/4194] Compiling source3/lib/substitute_generic.c
[1666/4194] Compiling source3/lib/ms_fnmatch.c
[1667/4194] Compiling source3/lib/tallocmsg.c
[1668/4194] Compiling source3/lib/gencache.c
[1669/4194] Compiling source3/lib/dmallocmsg.c
[1670/4194] Compiling source3/lib/substitute.c
[1671/4194] Compiling source3/lib/dumpcore.c
[1672/4194] Compiling source3/lib/smbrun.c
[1673/4194] Compiling source3/lib/wins_srv.c
[1674/4194] Compiling source3/lib/interface.c
[1675/4194] Compiling source3/lib/username.c
[1676/4194] Compiling source3/lib/addrchange.c
[1677/4194] Compiling lib/util/debug_s3.c
[1678/4194] Compiling source3/lib/serverid.c
[1679/4194] Compiling source3/lib/server_id_db_util.c
[1680/4194] Compiling source3/lib/server_id_watch.c
[1681/4194] Compiling source3/lib/util_cluster.c
[1682/4194] Compiling source3/lib/id_cache.c
[1683/4194] Compiling source3/lib/messages.c
[1684/4194] Compiling source3/lib/util_names.c
[1685/4194] Compiling source3/lib/ldap_debug_handler.c
[1686/4194] Compiling source3/lib/sharesec.c
[1687/4194] Compiling source3/param/loadparm.c
[1688/4194] Compiling source3/lib/smbconf/smbconf_init.c
[1689/4194] Compiling source3/lib/smbconf/smbconf_reg.c
[1690/4194] Compiling source3/lib/version.c
[1691/4194] Compiling source3/lib/util_tdb.c
[1692/4194] Compiling source3/libsmb/errormap.c
[1693/4194] Compiling source3/libsmb/smberr.c
[1694/4194] Compiling source3/lib/errmap_unix.c
[1695/4194] Compiling source3/param/util.c
[1696/4194] Compiling source3/param/loadparm_ctx.c
[1697/4194] Linking bin/default/source3/libsmbconf.so
[1698/4194] Compiling source4/libcli/ldap/ldap_controls.c
[1699/4194] Compiling source4/libcli/ldap/ldap_ildap.c
[1700/4194] Compiling source4/libcli/ldap/ldap_bind.c
[1701/4194] Compiling source4/libcli/ldap/ldap_client.c
[1702/4194] Compiling libcli/util/tstream.c
[1703/4194] Compiling source4/libcli/resolve/lmhosts.c
[1704/4194] Compiling source4/libcli/resolve/host.c
[1705/4194] Compiling source4/libcli/resolve/dns_ex.c
[1706/4194] Compiling source4/libcli/resolve/wins.c
[1707/4194] Compiling source4/libcli/resolve/nbtlist.c
[1708/4194] Compiling source4/libcli/resolve/resolve_lp.c
[1709/4194] Compiling source4/libcli/resolve/bcast.c
[1710/4194] Linking bin/default/source4/libcli/ldap/libcli-ldap-samba4.so=

[1711/4194] Compiling source3/passdb/secrets_lsa.c
[1712/4194] Compiling source3/passdb/machine_sid.c
[1713/4194] Compiling source3/passdb/machine_account_secrets.c
[1714/4194] Compiling source3/passdb/secrets.c
[1715/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_secrets.c
[1716/4194] Compiling librpc/ndr/ndr_dcerpc.c
[1717/4194] Linking bin/default/source3/libsecrets3-samba4.so
[1718/4194] Compiling bin/default/librpc/gen_ndr/ndr_dcerpc.c
[1719/4194] Compiling librpc/rpc/binding_handle.c
[1720/4194] Compiling librpc/rpc/dcerpc_error.c
[1721/4194] Compiling librpc/rpc/dcerpc_util.c
[1722/4194] Compiling librpc/rpc/binding.c
[1723/4194] Compiling libcli/cldap/cldap.c
[1724/4194] Linking bin/default/librpc/libdcerpc-binding.so
[1725/4194] Compiling libcli/netlogon/netlogon.c
[1726/4194] Compiling bin/default/librpc/gen_ndr/ndr_atsvc_c.c
[1727/4194] Compiling bin/default/librpc/gen_ndr/ndr_echo_c.c
[1728/4194] Compiling bin/default/librpc/gen_ndr/ndr_lsa_c.c
[1729/4194] Linking bin/default/libcli/cldap/libcli-cldap-samba4.so
[1730/4194] Compiling bin/default/librpc/gen_ndr/ndr_samr_c.c
[1731/4194] Compiling bin/default/librpc/gen_ndr/ndr_dfs_c.c
[1732/4194] Compiling bin/default/librpc/gen_ndr/ndr_spoolss_c.c
[1733/4194] Compiling bin/default/librpc/gen_ndr/ndr_wkssvc_c.c
[1734/4194] Compiling bin/default/librpc/gen_ndr/ndr_srvsvc_c.c
[1735/4194] Compiling bin/default/librpc/gen_ndr/ndr_svcctl_c.c
[1736/4194] Compiling bin/default/librpc/gen_ndr/ndr_eventlog_c.c
[1737/4194] Compiling bin/default/librpc/gen_ndr/ndr_epmapper_c.c
[1738/4194] Compiling bin/default/librpc/gen_ndr/ndr_winreg_c.c
[1739/4194] Compiling bin/default/librpc/gen_ndr/ndr_initshutdown_c.c
[1740/4194] Compiling bin/default/librpc/gen_ndr/ndr_ntsvcs_c.c
[1741/4194] Compiling bin/default/librpc/gen_ndr/ndr_netlogon_c.c
[1742/4194] Compiling bin/default/librpc/gen_ndr/ndr_dnsserver_c.c
[1743/4194] Compiling bin/default/librpc/dcerpc-samba.empty.c
[1744/4194] Linking bin/default/librpc/libdcerpc-samba-samba4.so
[1745/4194] Compiling source4/libcli/smb_composite/smb2.c
[1746/4194] Compiling source4/libcli/smb_composite/fsinfo.c
[1747/4194] Compiling source4/libcli/smb_composite/appendacl.c
[1748/4194] Compiling source4/libcli/smb_composite/fetchfile.c
[1749/4194] Compiling source4/libcli/smb_composite/sesssetup.c
[1750/4194] Compiling source4/libcli/smb_composite/connect.c
[1751/4194] Compiling source4/libcli/smb_composite/connect_nego.c
[1752/4194] Compiling source4/libcli/smb_composite/savefile.c
[1753/4194] Compiling source4/libcli/smb_composite/loadfile.c
[1754/4194] Compiling source4/libcli/raw/rawshadow.c
[1755/4194] Compiling source4/libcli/raw/rawlpq.c
[1756/4194] Compiling source4/libcli/raw/rawdate.c
[1757/4194] Compiling source4/libcli/raw/rawacl.c
[1758/4194] Compiling source4/libcli/raw/rawioctl.c
[1759/4194] Compiling source4/libcli/raw/rawnotify.c
[1760/4194] Compiling source4/libcli/raw/rawfileinfo.c
[1761/4194] Compiling source4/libcli/raw/rawfsinfo.c
[1762/4194] Compiling source4/libcli/raw/rawnegotiate.c
[1763/4194] Compiling source4/libcli/raw/clioplock.c
[1764/4194] Compiling source4/libcli/raw/rawsetfileinfo.c
[1765/4194] Compiling source4/libcli/raw/raweas.c
[1766/4194] Compiling source4/libcli/raw/rawtrans.c
[1767/4194] Compiling source4/libcli/raw/rawreadwrite.c
[1768/4194] Compiling source4/libcli/raw/rawsearch.c
[1769/4194] Compiling source4/libcli/raw/rawrequest.c
[1770/4194] Compiling source4/libcli/raw/clierror.c
[1771/4194] Compiling source4/libcli/raw/clitree.c
[1772/4194] Compiling source4/libcli/raw/clisession.c
[1773/4194] Compiling source4/libcli/raw/clitransport.c
[1774/4194] Compiling source4/libcli/raw/clisocket.c
[1775/4194] Compiling source4/libcli/raw/smb_signing.c
[1776/4194] Compiling source4/libcli/raw/rawfile.c
[1777/4194] Compiling source4/libcli/smb2/util.c
[1778/4194] Compiling source4/libcli/smb2/lock.c
[1779/4194] Compiling source4/libcli/smb2/flush.c
[1780/4194] Compiling source4/libcli/smb2/tdis.c
[1781/4194] Compiling source4/libcli/smb2/logoff.c
[1782/4194] Compiling source4/libcli/smb2/ioctl.c
[1783/4194] Compiling source4/libcli/smb2/find.c
[1784/4194] Compiling source4/libcli/smb2/setinfo.c
[1785/4194] Compiling source4/libcli/smb2/read.c
[1786/4194] Compiling source4/libcli/smb2/write.c
[1787/4194] Compiling source4/libcli/smb2/getinfo.c
[1788/4194] Compiling source4/libcli/smb2/connect.c
[1789/4194] Compiling source4/libcli/smb2/close.c
[1790/4194] Compiling source4/libcli/smb2/create.c
[1791/4194] Compiling source4/libcli/smb2/tcon.c
[1792/4194] Compiling source4/libcli/smb2/session.c
[1793/4194] Compiling source4/libcli/smb2/request.c
[1794/4194] Compiling source4/libcli/smb2/transport.c
[1795/4194] Compiling source4/libcli/smb2/lease_break.c
[1796/4194] Compiling source4/libcli/smb2/signing.c
[1797/4194] Compiling source4/libcli/smb2/break.c
[1798/4194] Compiling source4/libcli/smb2/keepalive.c
[1799/4194] Compiling source4/libcli/smb2/cancel.c
[1800/4194] Compiling source4/libcli/smb2/notify.c
[1801/4194] Linking bin/default/source4/libcli/libsmbclient-raw-samba4.so=

[1802/4194] Compiling source4/lib/http/http_auth.c
[1803/4194] Compiling source4/lib/http/http.c
[1804/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_winstation.c=

[1805/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_irpc.c
[1806/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_sasl_helpers=
=2Ec
[1807/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_winsif.c
[1808/4194] Linking bin/default/source4/lib/http/libhttp-samba4.so
[1809/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_opendb.c
[1810/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_ntp_signd.c
[1811/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_winsrepl.c
[1812/4194] Compiling bin/default/source4/librpc/ndr-samba4.empty.c
[1813/4194] Compiling bin/default/source4/librpc/gen_ndr/tables.c
[1814/4194] Compiling librpc/ndr/ndr_table.c
[1815/4194] Compiling bin/default/librpc/gen_ndr/ndr_audiosrv.c
[1816/4194] Compiling bin/default/librpc/gen_ndr/ndr_dsbackup.c
[1817/4194] Compiling bin/default/librpc/gen_ndr/ndr_efs.c
[1818/4194] Compiling bin/default/librpc/gen_ndr/ndr_rot.c
[1819/4194] Compiling bin/default/librpc/gen_ndr/ndr_frsrpc.c
[1820/4194] Compiling librpc/ndr/ndr_frsrpc.c
[1821/4194] Compiling bin/default/librpc/gen_ndr/ndr_frsapi.c
[1822/4194] Compiling bin/default/librpc/gen_ndr/ndr_frstrans.c
[1823/4194] Compiling bin/default/librpc/gen_ndr/ndr_dfsblobs.c
[1824/4194] Compiling bin/default/librpc/gen_ndr/ndr_bkupblobs.c
[1825/4194] Compiling librpc/ndr/ndr_bkupblobs.c
[1826/4194] Compiling bin/default/librpc/gen_ndr/ndr_fscc.c
[1827/4194] Compiling bin/default/librpc/gen_ndr/ndr_policyagent.c
[1828/4194] Compiling bin/default/librpc/gen_ndr/ndr_winspool.c
[1829/4194] Compiling bin/default/librpc/gen_ndr/ndr_dbgidl.c
[1830/4194] Compiling bin/default/librpc/gen_ndr/ndr_msgsvc.c
[1831/4194] Compiling bin/default/librpc/gen_ndr/ndr_oxidresolver.c
[1832/4194] Compiling bin/default/librpc/gen_ndr/ndr_remact.c
[1833/4194] Compiling bin/default/librpc/gen_ndr/ndr_wmi.c
[1834/4194] Compiling librpc/ndr/ndr_wmi.c
[1835/4194] Compiling bin/default/librpc/gen_ndr/ndr_wzcsvc.c
[1836/4194] Compiling bin/default/librpc/gen_ndr/ndr_browser.c
[1837/4194] Compiling bin/default/librpc/gen_ndr/ndr_w32time.c
[1838/4194] Compiling bin/default/librpc/gen_ndr/ndr_scerpc.c
[1839/4194] Compiling bin/default/librpc/gen_ndr/ndr_trkwks.c
[1840/4194] Compiling bin/default/librpc/gen_ndr/ndr_keysvc.c
[1841/4194] Compiling bin/default/librpc/gen_ndr/ndr_nfs4acl.c
[1842/4194] Compiling bin/default/librpc/gen_ndr/ndr_clusapi.c
[1843/4194] Compiling bin/default/librpc/gen_ndr/ndr_backupkey.c
[1844/4194] Compiling librpc/ndr/ndr_backupkey.c
[1845/4194] Compiling librpc/ndr/ndr_preg.c
[1846/4194] Compiling bin/default/librpc/gen_ndr/ndr_preg.c
[1847/4194] Compiling librpc/ndr/ndr_cab.c
[1848/4194] Compiling bin/default/librpc/gen_ndr/ndr_cab.c
[1849/4194] Compiling bin/default/librpc/gen_ndr/ndr_winbind.c
[1850/4194] Linking bin/default/source4/librpc/libndr-samba4.so
[1851/4194] Compiling source3/lib/util_cmdline.c
[1852/4194] Compiling source3/libads/sitename_cache.c
[1853/4194] Compiling source3/libsmb/conncache.c
[1854/4194] Compiling source3/libsmb/namequery.c
[1855/4194] Compiling source3/libsmb/nmblib.c
[1856/4194] Compiling source3/libsmb/namecache.c
[1857/4194] Linking bin/default/source3/libutil-cmdline-samba4.so
[1858/4194] Compiling source3/libsmb/unexpected.c
[1859/4194] Compiling source3/librpc/crypto/gse.c
[1860/4194] Compiling source3/librpc/crypto/gse_krb5.c
[1861/4194] Compiling source3/libads/ads_status.c
[1862/4194] Compiling source3/libads/kerberos.c
[1863/4194] Compiling source3/libads/cldap.c
[1864/4194] Linking bin/default/source3/libgse-samba4.so
[1865/4194] Compiling source4/param/loadparm.c
[1866/4194] Compiling source4/libcli/dgram/browse.c
[1867/4194] Compiling source4/libcli/dgram/netlogon.c
[1868/4194] Compiling source4/libcli/dgram/mailslot.c
[1869/4194] Compiling source4/libcli/dgram/dgramsocket.c
[1870/4194] Compiling source4/libcli/finddcs_cldap.c
[1871/4194] Compiling source4/libcli/clideltree.c
[1872/4194] Compiling source4/libcli/climessage.c
[1873/4194] Compiling source4/libcli/clitrans2.c
[1874/4194] Compiling source4/libcli/clilist.c
[1875/4194] Compiling source4/libcli/clifile.c
[1876/4194] Compiling source4/libcli/cliconnect.c
[1877/4194] Compiling source4/libcli/clireadwrite.c
[1878/4194] Compiling source4/librpc/rpc/dcerpc_secondary.c
[1879/4194] Compiling source4/librpc/rpc/dcerpc_connect.c
[1880/4194] Compiling source4/librpc/rpc/dcerpc_roh.c
[1881/4194] Compiling source4/librpc/rpc/dcerpc_roh_channel_out.c
[1882/4194] Compiling source4/librpc/rpc/dcerpc_sock.c
[1883/4194] Compiling source4/librpc/rpc/dcerpc_smb.c
[1884/4194] Compiling source4/librpc/rpc/dcerpc_util.c
[1885/4194] Compiling source4/librpc/rpc/dcerpc_schannel.c
[1886/4194] Compiling source4/librpc/rpc/dcerpc_auth.c
[1887/4194] Compiling source4/librpc/rpc/dcerpc.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/librpc/rpc/dcerpc.c: In function =E2=80=98dcerpc_pipe_bin=
ding_handle=E2=80=99:
=2E./../source4/librpc/rpc/dcerpc.c:637:2: warning: =E2=80=98dcerpc_bindi=
ng_handle_set_sync_ev=E2=80=99 is deprecated [-Wdeprecated-declarations]
  dcerpc_binding_handle_set_sync_ev(h, p->conn->event_ctx);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/librpc/rpc/dcerpc.h:33:0,
                 from ../../source4/librpc/rpc/dcerpc.c:27:
=2E./../source4/../librpc/rpc/rpc_common.h:315:19: note: declared here
 _DEPRECATED_ void dcerpc_binding_handle_set_sync_ev(struct dcerpc_bindin=
g_handle *h,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[1888/4194] Compiling source4/librpc/rpc/dcerpc_roh_channel_in.c
[1889/4194] Compiling bin/default/librpc/gen_ndr/ndr_mgmt_c.c
[1890/4194] Linking bin/default/source4/librpc/libdcerpc.so
[1891/4194] Compiling bin/default/librpc/gen_ndr/ndr_quota.c
[1892/4194] Compiling librpc/ndr/ndr_ioctl.c
[1893/4194] Compiling bin/default/librpc/gen_ndr/ndr_ioctl.c
[1894/4194] Compiling source3/libsmb/auth_generic.c
[1895/4194] Compiling source3/libsmb/clientgen.c
[1896/4194] Compiling source3/libsmb/smbsock_connect.c
[1897/4194] Compiling source3/libsmb/climessage.c
[1898/4194] Compiling source3/libsmb/clilist.c
[1899/4194] Compiling source3/libsmb/clidgram.c
[1900/4194] Compiling source3/libsmb/cli_smb2_fnum.c
[1901/4194] Compiling source3/libsmb/clisymlink.c
[1902/4194] Compiling source3/libsmb/reparse_symlink.c
[1903/4194] Compiling source3/libsmb/async_smb.c
[1904/4194] Compiling source3/libsmb/clirap2.c
[1905/4194] Compiling source3/libsmb/clioplock.c
[1906/4194] Compiling source3/libsmb/clidfs.c
[1907/4194] Compiling source3/libsmb/cliquota.c
[1908/4194] Compiling source3/libsmb/clifsinfo.c
[1909/4194] Compiling source3/libsmb/clistr.c
[1910/4194] Compiling source3/libsmb/clisecdesc.c
[1911/4194] Compiling source3/libsmb/cliprint.c
[1912/4194] Compiling source3/libsmb/clitrans.c
[1913/4194] Compiling source3/libsmb/clireadwrite.c
[1914/4194] Compiling source3/libsmb/clispnego.c
[1915/4194] Compiling source3/libsmb/clierror.c
[1916/4194] Compiling source3/libsmb/clirap.c
[1917/4194] Compiling source3/libsmb/clifile.c
[1918/4194] Compiling source3/libsmb/cliconnect.c
[1919/4194] Linking bin/default/source3/liblibsmb-samba4.so
[1920/4194] Compiling source3/lib/smbldap.c
[1921/4194] Compiling libcli/auth/netlogon_creds_cli.c
[1922/4194] Compiling source3/librpc/rpc/dcerpc_helpers.c
[1923/4194] Compiling source3/rpc_client/rpc_transport_tstream.c
[1924/4194] Compiling source3/rpc_client/rpc_transport_sock.c
[1925/4194] Compiling source3/rpc_client/rpc_transport_np.c
[1926/4194] Linking bin/default/source3/libsmbldap.so
[1927/4194] Compiling source3/rpc_client/cli_pipe.c
[1928/4194] Linking bin/default/source3/libmsrpc3-samba4.so
[1929/4194] Compiling source3/passdb/pdb_ldap_util.c
[1930/4194] Compiling source3/passdb/pdb_ldap_schema.c
[1931/4194] Compiling source4/lib/messaging/messaging_handlers.c
[1932/4194] Linking bin/default/source3/libsmbldaphelper-samba4.so
[1933/4194] Compiling source4/lib/messaging/messaging.c
[1934/4194] Compiling bin/default/source4/librpc/dcerpc-samba4.empty.c
[1935/4194] Compiling bin/default/librpc/gen_ndr/ndr_winbind_c.c
[1936/4194] Compiling source4/winbind/idmap.c
[1937/4194] Linking bin/default/source4/lib/messaging/libMESSAGING-samba4=
=2Eso
[1938/4194] Compiling source3/groupdb/mapping.c
[1939/4194] Compiling source3/groupdb/mapping_tdb.c
[1940/4194] Linking bin/default/source4/librpc/libdcerpc-samba4.so
[1941/4194] Compiling bin/default/source3/samba-passdb.empty.c
[1942/4194] Compiling source3/lib/winbind_util.c
[1943/4194] Compiling source3/lib/util_nscd.c
[1944/4194] Compiling source3/lib/privileges.c
[1945/4194] Compiling source3/passdb/account_pol.c
[1946/4194] Compiling source3/passdb/login_cache.c
[1947/4194] Compiling source3/passdb/lookup_sid.c
[1948/4194] Compiling source3/lib/util_unixsids.c
[1949/4194] Compiling source3/lib/util_sid_passdb.c
[1950/4194] Compiling source3/passdb/pdb_compat.c
[1951/4194] Compiling source3/lib/util_builtin.c
[1952/4194] Compiling source3/passdb/pdb_util.c
[1953/4194] Compiling source3/passdb/pdb_get_set.c
[1954/4194] Compiling source3/lib/util_wellknown.c
[1955/4194] Compiling source3/passdb/passdb.c
[1956/4194] Compiling source3/passdb/pdb_secrets.c
[1957/4194] Compiling source3/passdb/pdb_interface.c
[1958/4194] Compiling source3/lib/server_mutex.c
[1959/4194] Compiling source3/passdb/pdb_tdb.c
[1960/4194] Compiling source3/passdb/pdb_nds.c
[1961/4194] Compiling source3/passdb/pdb_ldap.c
[1962/4194] Compiling source3/passdb/pdb_smbpasswd.c
[1963/4194] Compiling source3/passdb/pdb_samba_dsdb.c
[1964/4194] Linking bin/default/source3/libsamba-passdb.so
[1965/4194] Compiling source3/rpc_client/cli_netlogon.c
[1966/4194] Compiling source3/rpc_client/util_netlogon.c
[1967/4194] Compiling source3/rpc_client/init_netlogon.c
[1968/4194] Compiling nsswitch/wb_reqtrans.c
[1969/4194] Compiling source4/libcli/wbclient/wbclient.c
[1970/4194] Compiling source3/rpc_client/init_lsa.c
[1971/4194] Linking bin/default/source3/liblibcli-netlogon3-samba4.so
[1972/4194] Compiling source3/rpc_client/cli_lsarpc.c
[1973/4194] Compiling source3/libsmb/trusts_util.c
[1974/4194] Linking bin/default/source4/libcli/wbclient/libLIBWBCLIENT-OL=
D-samba4.so
[1975/4194] Compiling source4/auth/unix_token.c
[1976/4194] Linking bin/default/source3/liblibcli-lsa3-samba4.so
[1977/4194] Linking bin/default/source3/libtrusts-util-samba4.so
[1978/4194] Compiling source3/libads/util.c
[1979/4194] Compiling source3/libads/ndr.c
[1980/4194] Linking bin/default/source4/auth/libauth-unix-token-samba4.so=

[1981/4194] Compiling source3/libads/ldap_utils.c
[1982/4194] Compiling source3/libads/ads_struct.c
[1983/4194] Compiling source3/libads/ldap_user.c
[1984/4194] Compiling source3/libads/krb5_setpw.c
[1985/4194] Compiling source3/libads/sasl_wrapping.c
[1986/4194] Compiling source3/libads/kerberos_util.c
[1987/4194] Compiling source3/libads/sasl.c
[1988/4194] Compiling source3/libads/disp_sec.c
[1989/4194] Compiling source3/libads/ldap_schema.c
[1990/4194] Compiling source3/libads/kerberos_keytab.c
[1991/4194] Compiling source3/libads/ldap.c
[1992/4194] Compiling source3/libads/net_ads_setspn.c
[1993/4194] Compiling source3/libsmb/dsgetdcname.c
[1994/4194] Compiling source3/libsmb/namequery_dc.c
[1995/4194] Linking bin/default/source3/libads-samba4.so
[1996/4194] Compiling bin/default/source4/librpc/gen_ndr/ndr_irpc_c.c
[1997/4194] Compiling source4/auth/ntlm/auth_sam.c
[1998/4194] Compiling source4/auth/ntlm/auth_anonymous.c
[1999/4194] Compiling source4/auth/ntlm/auth_winbind.c
[2000/4194] Compiling source4/auth/ntlm/auth_developer.c
[2001/4194] Compiling source4/auth/ntlm/auth_unix.c
[2002/4194] Compiling source4/auth/ntlm/auth_simple.c
[2003/4194] Compiling source4/auth/ntlm/auth_util.c
[2004/4194] Compiling source4/auth/ntlm/auth.c
[2005/4194] Linking bin/default/source4/auth/ntlm/libauth4-samba4.so
[2006/4194] Compiling source4/auth/samba_server_gensec.c
[2007/4194] Compiling source3/auth/pampass.c
[2008/4194] Compiling source3/auth/pass_check.c
[2009/4194] Compiling source3/libsmb/samlogon_cache.c
[2010/4194] Compiling source3/auth/token_util.c
[2011/4194] Compiling source3/auth/user_util.c
[2012/4194] Compiling source3/auth/user_info.c
[2013/4194] Compiling source3/auth/server_info_sam.c
[2014/4194] Compiling source3/auth/server_info.c
[2015/4194] Compiling source3/auth/check_samsec.c
[2016/4194] Compiling source3/auth/auth_util.c
[2017/4194] Compiling source3/auth/auth_generic.c
[2018/4194] Compiling source3/auth/auth_ntlmssp.c
[2019/4194] Compiling source3/auth/user_krb5.c
[2020/4194] Compiling source3/auth/auth.c
[2021/4194] Compiling source3/auth/auth_sam.c
[2022/4194] Compiling source3/auth/auth_unix.c
[2023/4194] Compiling source3/auth/auth_winbind.c
[2024/4194] Compiling source3/auth/auth_builtin.c
[2025/4194] Compiling source3/auth/auth_samba4.c
[2026/4194] Linking bin/default/source3/auth/libauth-samba4.so
[2027/4194] Compiling source3/libnet/libnet_keytab.c
[2028/4194] Compiling source3/rpc_client/init_spoolss.c
[2029/4194] Compiling source3/rpc_client/cli_spoolss.c
[2030/4194] Compiling source3/rpc_client/cli_samr.c
[2031/4194] Compiling libcli/named_pipe_auth/npa_tstream.c
[2032/4194] Compiling libcli/named_pipe_auth/tstream_u32_read.c
[2033/4194] Linking bin/default/source3/libnet-keytab-samba4.so
[2034/4194] Linking bin/default/source3/libcli-spoolss-samba4.so
[2035/4194] Compiling source3/rpc_client/cli_pipe_schannel.c
[2036/4194] Compiling source3/rpc_client/init_samr.c
[2037/4194] Linking bin/default/libcli/named_pipe_auth/libnpa-tstream-sam=
ba4.so
[2038/4194] Compiling source3/lib/netapi/libnetapi.c
[2039/4194] Compiling source3/lib/netapi/share.c
[2040/4194] Compiling source3/lib/netapi/file.c
[2041/4194] Compiling source3/lib/netapi/shutdown.c
[2042/4194] Compiling source3/lib/netapi/cm.c
[2043/4194] Compiling source3/lib/netapi/netapi.c
[2044/4194] Compiling source3/lib/netapi/sid.c
[2045/4194] Compiling source3/lib/netapi/joindomain.c
[2046/4194] Compiling source3/lib/netapi/localgroup.c
[2047/4194] Compiling source3/lib/netapi/user.c
[2048/4194] Compiling source3/lib/netapi/getdc.c
[2049/4194] Compiling source3/lib/netapi/netlogon.c
[2050/4194] Compiling source3/lib/netapi/samr.c
[2051/4194] Compiling source3/lib/netapi/group.c
[2052/4194] Compiling source3/lib/netapi/wkstainfo.c
[2053/4194] Compiling source3/lib/netapi/serverinfo.c
[2054/4194] Compiling source3/libnet/libnet_join.c
[2055/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_libnetapi.c
[2056/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_libnet_join.=
c
[2057/4194] Linking bin/default/source3/libnetapi.so
[2058/4194] Compiling lib/talloc/pytalloc_util.c
[2059/4194] Compiling dfs_server/dfs_server_ad.c
[2060/4194] Compiling source3/smbd/conn.c
[2061/4194] Compiling source3/printing/nt_printing_os2.c
[2062/4194] Compiling source3/rpc_client/cli_winreg_spoolss.c
[2063/4194] Compiling source3/printing/nt_printing_migrate.c
[2064/4194] Linking bin/default/lib/talloc/libpytalloc-util.cpython-36m-x=
86-64-linux-gnu.so
[2065/4194] Linking bin/default/dfs_server/libdfs-server-ad-samba4.so
[2066/4194] Linking bin/default/source3/libsmbd-conn-samba4.so
[2067/4194] Compiling source3/rpc_client/cli_winreg.c
[2068/4194] Linking bin/default/source3/libprinting-migrate-samba4.so
[2069/4194] Compiling bin/default/python/samba_python.cpython-36m-x86_64-=
linux-gnu.empty.c
[2070/4194] Compiling python/modules.c
[2071/4194] Compiling source4/param/pyparam_util.c
[2072/4194] Compiling source4/librpc/rpc/pyrpc_util.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/librpc/rpc/pyrpc_util.c: In function =E2=80=98pyrpc_irpc_=
connect=E2=80=99:
=2E./../source4/librpc/rpc/pyrpc_util.c:92:2: warning: =E2=80=98dcerpc_bi=
nding_handle_set_sync_ev=E2=80=99 is deprecated [-Wdeprecated-declaration=
s]
  dcerpc_binding_handle_set_sync_ev(*binding_handle, event_ctx);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/librpc/rpc/dcerpc.h:33:0,
                 from ../../source4/librpc/rpc/pyrpc_util.c:28:
=2E./../source4/../librpc/rpc/rpc_common.h:315:19: note: declared here
 _DEPRECATED_ void dcerpc_binding_handle_set_sync_ev(struct dcerpc_bindin=
g_handle *h,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2073/4194] Compiling source3/rpc_server/srv_pipe_register.c
[2074/4194] Compiling lib/afs/afs_settoken.c
[2075/4194] Linking bin/default/python/libsamba-python.cpython-36m-x86-64=
-linux-gnu-samba4.so
[2076/4194] Compiling source3/registry/reg_parse_prs.c
[2077/4194] Compiling source3/registry/regfio.c
[2078/4194] Compiling source3/locking/share_mode_lock.c
[2079/4194] Compiling source3/locking/brlock.c
[2080/4194] Compiling source3/locking/posix.c
[2081/4194] Compiling source3/locking/locking.c
[2082/4194] Compiling source3/locking/leases_db.c
[2083/4194] Compiling source3/locking/leases_util.c
[2084/4194] Compiling source3/lib/filename_util.c
[2085/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_leases_db.c
[2086/4194] Compiling source3/rpc_server/rpc_config.c
[2087/4194] Compiling source3/rpc_server/rpc_contexts.c
[2088/4194] Compiling source3/rpc_server/rpc_handles.c
[2089/4194] Compiling source3/rpc_server/rpc_ncacn_np.c
[2090/4194] Compiling source3/rpc_server/rpc_server.c
[2091/4194] Compiling source3/rpc_server/dcesrv_auth_generic.c
[2092/4194] Compiling source3/rpc_server/srv_access_check.c
[2093/4194] Compiling source3/rpc_server/srv_pipe.c
[2094/4194] Compiling source3/rpc_server/srv_pipe_hnd.c
[2095/4194] Compiling bin/default/librpc/gen_ndr/srv_samr.c
[2096/4194] Compiling source3/rpc_server/samr/srv_samr_chgpasswd.c
[2097/4194] Compiling source3/rpc_server/samr/srv_samr_util.c
[2098/4194] Compiling source3/rpc_server/samr/srv_samr_nt.c
[2099/4194] Compiling lib/afs/afs_funcs.c
[2100/4194] Compiling bin/default/librpc/gen_ndr/ndr_fsrvp_state.c
[2101/4194] Compiling source3/libads/authdata.c
[2102/4194] Compiling source3/printing/printing_db.c
[2103/4194] Compiling source3/printing/notify.c
[2104/4194] Compiling source3/lib/eventlog/eventlog.c
[2105/4194] Compiling source3/lib/lsa.c
[2106/4194] Compiling bin/default/source3/rpc_server/rpc.empty.c
[2107/4194] Compiling source3/rpc_server/fss/srv_fss_state.c
[2108/4194] Compiling bin/default/librpc/gen_ndr/srv_lsa.c
[2109/4194] Compiling source3/rpc_server/lsa/srv_lsa_nt.c
[2110/4194] Compiling source3/smbd/notifyd/notifyd.c
[2111/4194] Compiling bin/default/librpc/gen_ndr/ndr_printcap.c
[2112/4194] Compiling bin/default/librpc/gen_ndr/ndr_smb_acl.c
[2113/4194] Compiling source3/registry/reg_init_full.c
[2114/4194] Compiling source3/registry/reg_perfcount.c
[2115/4194] Compiling source3/registry/reg_backend_perflib.c
[2116/4194] Compiling source3/registry/reg_backend_current_version.c
[2117/4194] Compiling source3/registry/reg_backend_hkpt_params.c
[2118/4194] Compiling source3/registry/reg_backend_tcpip_params.c
[2119/4194] Compiling source3/registry/reg_backend_prod_options.c
[2120/4194] Compiling source3/registry/reg_backend_netlogon_params.c
[2121/4194] Compiling source3/registry/reg_backend_printing.c
[2122/4194] Compiling source3/registry/reg_backend_shares.c
[2123/4194] Compiling source3/libads/ldap_printer.c
[2124/4194] Compiling source3/lib/sysquotas_nfs.c
[2125/4194] Compiling source3/lib/sysquotas_jfs2.c
[2126/4194] Compiling source3/lib/sysquotas_4B.c
[2127/4194] Compiling source3/lib/sysquotas_4A.c
[2128/4194] Compiling source3/lib/sysquotas_xfs.c
[2129/4194] Compiling source3/lib/sysquotas_linux.c
[2130/4194] Compiling source3/lib/sysquotas.c
[2131/4194] Compiling source3/smbd/uid.c
[2132/4194] Compiling source3/smbd/smb2_keepalive.c
[2133/4194] Compiling source3/smbd/smb2_ioctl_network_fs.c
[2134/4194] Compiling source3/smbd/smb2_ioctl_named_pipe.c
[2135/4194] Compiling source3/smbd/smb2_ioctl_filesys.c
[2136/4194] Compiling source3/smbd/smb2_ioctl_dfs.c
[2137/4194] Compiling source3/smbd/smb2_ioctl.c
[2138/4194] Compiling source3/smbd/smb2_lock.c
[2139/4194] Compiling source3/smbd/smb2_write.c
[2140/4194] Compiling source3/smbd/smb2_read.c
[2141/4194] Compiling source3/smbd/sec_ctx.c
[2142/4194] Compiling source3/smbd/smb2_flush.c
[2143/4194] Compiling source3/smbd/smb2_close.c
[2144/4194] Compiling source3/smbd/smb2_create.c
[2145/4194] Compiling source3/smbd/smb2_sesssetup.c
[2146/4194] Compiling source3/smbd/smb2_negprot.c
[2147/4194] Compiling source3/smbd/smb2_glue.c
[2148/4194] Compiling source3/smbd/smb2_server.c
[2149/4194] Compiling source3/smbd/globals.c
[2150/4194] Compiling source3/smbd/dmapi.c
[2151/4194] Compiling source3/smbd/mangle_hash2.c
[2152/4194] Compiling source3/smbd/notify_inotify.c
[2153/4194] Compiling source3/smbd/dnsregister.c
[2154/4194] Compiling source3/smbd/statvfs.c
[2155/4194] Compiling source3/smbd/ntquotas.c
[2156/4194] Compiling source3/smbd/oplock.c
[2157/4194] Compiling source3/smbd/mangle_hash.c
[2158/4194] Compiling source3/smbd/file_access.c
[2159/4194] Compiling source3/smbd/aio.c
[2160/4194] Compiling source3/smbd/mangle.c
[2161/4194] Compiling source3/smbd/scavenger.c
[2162/4194] Compiling source3/smbd/msdfs.c
[2163/4194] Compiling bin/default/source3/smbd/build_options.c
[2164/4194] Compiling source3/smbd/notify_msg.c
[2165/4194] Compiling source3/smbd/oplock_linux.c
[2166/4194] Compiling source3/smbd/notify.c
[2167/4194] Compiling source3/smbd/durable.c
[2168/4194] Compiling source3/smbd/server_exit.c
[2169/4194] Compiling source3/smbd/signing.c
[2170/4194] Compiling source3/smbd/smbXsrv_open.c
[2171/4194] Compiling source3/smbd/quotas.c
[2172/4194] Compiling source3/smbd/smbXsrv_tcon.c
[2173/4194] Compiling source3/smbd/fake_file.c
[2174/4194] Compiling source3/smbd/smbXsrv_session.c
[2175/4194] Compiling source3/smbd/smbXsrv_client.c
[2176/4194] Compiling source3/smbd/srvstr.c
[2177/4194] Compiling source3/smbd/smbXsrv_version.c
[2178/4194] Compiling source3/lib/cleanupdb.c
[2179/4194] Compiling source3/smbd/smb2_break.c
[2180/4194] Compiling source3/smbd/vfs.c
[2181/4194] Compiling source3/printing/printspoolss.c
[2182/4194] Compiling source3/smbd/smb2_tcon.c
[2183/4194] Compiling source3/smbd/smb2_setinfo.c
[2184/4194] Compiling source3/smbd/smb2_getinfo.c
[2185/4194] Compiling source3/smbd/password.c
[2186/4194] Compiling source3/lib/sessionid_tdb.c
[2187/4194] Compiling source3/smbd/smb2_notify.c
[2188/4194] Compiling source3/smbd/smb2_query_directory.c
[2189/4194] Compiling source3/smbd/error.c
[2190/4194] Compiling source3/smbd/fileio.c
[2191/4194] Compiling source3/smbd/service.c
[2192/4194] Compiling source3/smbd/process.c
[2193/4194] Compiling source3/lib/sysacls.c
[2194/4194] Compiling source3/smbd/posix_acls.c
[2195/4194] Compiling source3/smbd/filename.c
[2196/4194] Compiling source3/smbd/seal.c
[2197/4194] Compiling source3/smbd/statcache.c
[2198/4194] Compiling source3/smbd/perfcount.c
[2199/4194] Compiling source3/smbd/close.c
[2200/4194] Compiling source3/smbd/dosmode.c
[2201/4194] Compiling source3/smbd/trans2.c
[2202/4194] Compiling source3/smbd/pipes.c
[2203/4194] Compiling source3/smbd/nttrans.c
[2204/4194] Compiling source3/smbd/lanman.c
[2205/4194] Compiling source3/smbd/ipc.c
[2206/4194] Compiling source3/smbd/share_access.c
[2207/4194] Compiling source3/smbd/conn_idle.c
[2208/4194] Compiling source3/smbd/conn_msg.c
[2209/4194] Compiling source3/smbd/dir.c
[2210/4194] Compiling source3/smbd/dfree.c
[2211/4194] Compiling source3/smbd/session.c
[2212/4194] Compiling source3/smbd/utmp.c
[2213/4194] Compiling source3/smbd/connection.c
[2214/4194] Compiling source3/smbd/server_reload.c
[2215/4194] Compiling source3/smbd/files.c
[2216/4194] Compiling source3/smbd/negprot.c
[2217/4194] Compiling source3/smbd/reply.c
[2218/4194] Compiling source3/smbd/sesssetup.c
[2219/4194] Compiling source3/smbd/message.c
[2220/4194] Compiling source3/smbd/blocking.c
[2221/4194] Compiling source3/smbd/open.c
[2222/4194] Compiling source3/profile/profile.c
[2223/4194] Compiling source3/printing/nt_printing_ads.c
[2224/4194] Compiling source3/printing/queue_process.c
[2225/4194] Compiling source3/printing/nt_printing_migrate_internal.c
[2226/4194] Compiling source3/printing/nt_printing_tdb.c
[2227/4194] Compiling source3/printing/nt_printing.c
[2228/4194] Compiling source3/printing/printing.c
[2229/4194] Compiling source3/printing/print_iprint.c
[2230/4194] Compiling source3/printing/printer_list.c
[2231/4194] Compiling source3/printing/lpq_parse.c
[2232/4194] Compiling source3/printing/print_cups.c
[2233/4194] Compiling source3/printing/print_svid.c
[2234/4194] Compiling source3/printing/print_standard.c
[2235/4194] Compiling source3/printing/load.c
[2236/4194] Compiling source3/printing/print_generic.c
[2237/4194] Compiling source3/printing/print_aix.c
[2238/4194] Compiling source3/printing/pcap.c
[2239/4194] Compiling source3/services/svc_winreg.c
[2240/4194] Compiling source3/services/svc_netlogon.c
[2241/4194] Compiling source3/services/svc_spoolss.c
[2242/4194] Compiling source3/services/svc_winreg_glue.c
[2243/4194] Compiling source3/services/svc_rcinit.c
[2244/4194] Compiling source3/services/svc_wins.c
[2245/4194] Compiling source3/rpc_client/cli_winreg_int.c
[2246/4194] Compiling source3/printing/spoolssd.c
[2247/4194] Compiling bin/default/source3/librpc/gen_ndr/ndr_perfcount.c
[2248/4194] Compiling source3/modules/vfs_acl_common.c
[2249/4194] Compiling bin/default/source3/modules/vfs.empty.c
[2250/4194] Compiling source3/modules/offload_token.c
[2251/4194] Compiling source3/modules/vfs_default.c
[2252/4194] Compiling source3/modules/vfs_not_implemented.c
[2253/4194] Compiling source3/modules/vfs_posixacl.c
[2254/4194] Compiling source3/modules/vfs_dfs_samba4.c
[2255/4194] Compiling source3/param/service.c
[2256/4194] Compiling source3/rpc_server/rpc_modules.c
[2257/4194] Compiling bin/default/librpc/gen_ndr/srv_dssetup.c
[2258/4194] Compiling source3/rpc_server/dssetup/srv_dssetup_nt.c
[2259/4194] Compiling bin/default/librpc/gen_ndr/srv_epmapper.c
[2260/4194] Compiling source3/rpc_server/epmapper/srv_epmapper.c
[2261/4194] Compiling source3/rpc_server/fss/srv_fss_agent.c
[2262/4194] Compiling bin/default/librpc/gen_ndr/srv_fsrvp.c
[2263/4194] Compiling source3/rpc_server/eventlog/srv_eventlog_nt.c
[2264/4194] Compiling source3/rpc_server/eventlog/srv_eventlog_reg.c
[2265/4194] Compiling bin/default/librpc/gen_ndr/srv_eventlog.c
[2266/4194] Compiling bin/default/librpc/gen_ndr/srv_initshutdown.c
[2267/4194] Compiling source3/rpc_server/initshutdown/srv_initshutdown_nt=
=2Ec
[2268/4194] Compiling bin/default/librpc/gen_ndr/srv_dfs.c
[2269/4194] Compiling source3/rpc_server/dfs/srv_dfs_nt.c
[2270/4194] Compiling source3/rpc_server/netlogon/srv_netlog_nt.c
[2271/4194] Compiling bin/default/librpc/gen_ndr/srv_netlogon.c
[2272/4194] Compiling bin/default/librpc/gen_ndr/srv_ntsvcs.c
[2273/4194] Compiling source3/rpc_server/ntsvcs/srv_ntsvcs_nt.c
[2274/4194] Compiling source3/rpc_server/echo/srv_echo_nt.c
[2275/4194] Compiling bin/default/librpc/gen_ndr/srv_echo.c
[2276/4194] Compiling source3/rpc_server/spoolss/srv_spoolss_nt.c
[2277/4194] Compiling source3/rpc_server/spoolss/srv_spoolss_util.c
[2278/4194] Compiling source3/rpc_server/spoolss/srv_iremotewinspool.c
[2279/4194] Compiling source3/rpc_server/spoolss/srv_iremotewinspool_nt.c=

[2280/4194] Compiling bin/default/librpc/gen_ndr/srv_srvsvc.c
[2281/4194] Compiling source3/rpc_server/srvsvc/srv_srvsvc_nt.c
[2282/4194] Compiling bin/default/librpc/gen_ndr/srv_svcctl.c
[2283/4194] Compiling source3/rpc_server/svcctl/srv_svcctl_reg.c
[2284/4194] Compiling source3/rpc_server/svcctl/srv_svcctl_nt.c
[2285/4194] Compiling source3/rpc_server/winreg/srv_winreg_nt.c
[2286/4194] Compiling bin/default/librpc/gen_ndr/srv_winreg.c
[2287/4194] Compiling bin/default/librpc/gen_ndr/srv_wkssvc.c
[2288/4194] Compiling source3/rpc_server/wkssvc/srv_wkssvc_nt.c
[2289/4194] Compiling source3/librpc/rpc/dcerpc_ep.c
[2290/4194] Compiling source3/rpc_server/rpc_ep_register.c
[2291/4194] Compiling source3/rpc_server/rpc_service_setup.c
[2292/4194] Compiling source3/rpc_server/rpc_sock_helper.c
[2293/4194] Linking bin/default/source3/libsmbd-base-samba4.so
[2294/4194] Compiling bin/default/source4/dsdb/samdb/ldb_modules/dsdb-mod=
ule.empty.c
[2295/4194] Compiling source4/dsdb/samdb/ldb_modules/netlogon.c
[2296/4194] Compiling source4/dsdb/samdb/ldb_modules/schema_util.c
[2297/4194] Compiling source4/dsdb/samdb/ldb_modules/acl_util.c
[2298/4194] Compiling source4/dsdb/samdb/ldb_modules/util.c
[2299/4194] Compiling source4/dsdb/samdb/ldb_modules/ridalloc.c
[2300/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libdsdb-mo=
dule-samba4.so
[2301/4194] Compiling source3/lib/netapi/examples/common.c
[2302/4194] Compiling source4/smbd/process_model.c
[2303/4194] Compiling source4/smbd/process_single.c
[2304/4194] Compiling third_party/cmocka/cmocka.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98free_value=E2=80=
=99:
=2E./../third_party/cmocka/cmocka.c:710:10: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     free((void*)value);
          ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98free_symbol_map=
_value=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:717:40: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     SymbolMapValue * const map_value =3D (SymbolMapValue*)value;
                                        ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98symbol_names_ma=
tch=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:732:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     return !strcmp(((SymbolMapValue*)map_value)->symbol_name,
                     ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98add_symbol_valu=
e=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:762:24: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     target_map_value =3D (SymbolMapValue*)target_node->value;
                        ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98get_symbol_valu=
e=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:798:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
         map_value =3D (SymbolMapValue*)target_node->value;
                     ^
=2E./../third_party/cmocka/cmocka.c:809:23: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
             *output =3D (void*) value_node->value;
                       ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98remove_always_r=
eturn_values=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:864:40: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
         SymbolMapValue * const value =3D (SymbolMapValue*)current->value=
;
                                        ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_for_lefto=
ver_values=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:925:13: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
             (SymbolMapValue*)current->value;
             ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98_function_calle=
d=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:1001:25: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
         expected_call =3D (FuncOrderingValue *)value_node->value;
                         ^
=2E./../third_party/cmocka/cmocka.c:1011:33: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
                 expected_call =3D (FuncOrderingValue *)value_node->value=
;
                                 ^
=2E./../third_party/cmocka/cmocka.c:1021:37: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
                     expected_call =3D (FuncOrderingValue *)value_node->v=
alue;
                                     ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98memory_equal_di=
splay_error=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:1284:37: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
                        differences, (void *)a, (void *)b);
                                     ^
=2E./../third_party/cmocka/cmocka.c:1284:48: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
                        differences, (void *)a, (void *)b);
                                                ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98memory_not_equa=
l_display_error=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:1309:30: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
                        same, (void *)a, (void *)b);
                              ^
=2E./../third_party/cmocka/cmocka.c:1309:41: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
                        same, (void *)a, (void *)b);
                                         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_in_set=E2=
=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1320:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(CheckIntegerSet*,
         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_not_in_se=
t=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1329:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(CheckIntegerSet*,
         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_in_range=E2=
=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1384:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(CheckIntegerRange*,
         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_not_in_ra=
nge=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1396:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(CheckIntegerRange*,
         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_string=E2=
=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1483:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(char*, value),
         ^
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1484:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(char*, check_value_data));=

         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_not_strin=
g=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1505:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(char*, value),
         ^
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1506:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(char*, check_value_data));=

         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_memory=E2=
=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1525:37: note: in expansion of macro =
=E2=80=98cast_largest_integral_type_to_pointer=E2=80=99
     CheckMemoryData * const check =3D cast_largest_integral_type_to_poin=
ter(
                                     ^
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1529:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(const char*, value),
         ^
=2E./../third_party/cmocka/cmocka.c: In function =E2=80=98check_not_memor=
y=E2=80=99:
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1569:37: note: in expansion of macro =
=E2=80=98cast_largest_integral_type_to_pointer=E2=80=99
     CheckMemoryData * const check =3D cast_largest_integral_type_to_poin=
ter(
                                     ^
=2E./../third_party/cmocka/cmocka.c:129:21: warning: cast discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wcast-qual]
     ((pointer_type)((ValuePointer*)&(largest_integral_type))->x.pointer)=

                     ^
=2E./../third_party/cmocka/cmocka.c:1573:9: note: in expansion of macro =E2=
=80=98cast_largest_integral_type_to_pointer=E2=80=99
         cast_largest_integral_type_to_pointer(const char*, value),
         ^


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2305/4194] Compiling source3/lib/popt_common.c
[2306/4194] Compiling lib/ldb/ldb_tdb/ldb_tdb_err_map.c
[2307/4194] Compiling source3/lib/cmdline_contexts.c
[2308/4194] Linking bin/default/source4/smbd/libprocess-model-samba4.so
[2309/4194] Compiling source4/ntvfs/posix/posix_eadb.c
[2310/4194] Linking bin/default/third_party/cmocka/libcmocka-samba4.so
[2311/4194] Linking bin/default/source3/libpopt-samba3-samba4.so
[2312/4194] Linking bin/default/lib/ldb/libldb-tdb-err-map-samba4.so
[2313/4194] Linking bin/default/source3/libcmdline-contexts-samba4.so
[2314/4194] Compiling source3/libsmb/libsmb_setget.c
[2315/4194] Linking bin/default/source4/ntvfs/posix/libposix-eadb-samba4.=
so
[2316/4194] Compiling source3/libsmb/libsmb_cache.c
[2317/4194] Compiling source3/libsmb/libsmb_compat.c
[2318/4194] Compiling source3/libsmb/libsmb_context.c
[2319/4194] Compiling source3/libsmb/libsmb_server.c
[2320/4194] Compiling source3/libsmb/libsmb_stat.c
[2321/4194] Compiling source3/libsmb/libsmb_xattr.c
[2322/4194] Compiling source3/libsmb/libsmb_path.c
[2323/4194] Compiling source3/libsmb/libsmb_misc.c
[2324/4194] Compiling source3/libsmb/libsmb_file.c
[2325/4194] Compiling source3/libsmb/libsmb_printjob.c
[2326/4194] Compiling source3/libsmb/libsmb_dir.c
[2327/4194] Linking bin/default/source3/libsmb/libsmbclient.so
[2328/4194] Compiling source4/smbd/service.c
[2329/4194] Compiling source4/smbd/service_named_pipe.c
[2330/4194] Compiling source4/smbd/service_task.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/smbd/service_task.c: In function =E2=80=98task_server_ter=
minate=E2=80=99:
=2E./../source4/smbd/service_task.c:49:4: warning: =E2=80=98dcerpc_bindin=
g_handle_set_sync_ev=E2=80=99 is deprecated [-Wdeprecated-declarations]
    dcerpc_binding_handle_set_sync_ev(irpc_handle, event_ctx);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/librpc/rpc/dcerpc.h:33:0,
                 from source4/librpc/gen_ndr/ndr_irpc_c.h:1,
                 from ../../source4/smbd/service_task.c:26:
=2E./../source4/../librpc/rpc/rpc_common.h:315:19: note: declared here
 _DEPRECATED_ void dcerpc_binding_handle_set_sync_ev(struct dcerpc_bindin=
g_handle *h,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2331/4194] Compiling source4/smbd/service_stream.c
[2332/4194] Compiling source4/auth/ntlm/auth_server_service.c
[2333/4194] Compiling source4/dns_server/dnsserver_common.c
[2334/4194] Compiling source4/echo_server/echo_server.c
[2335/4194] Linking bin/default/source4/smbd/libservice-samba4.so
[2336/4194] Compiling source4/param/share.c
[2337/4194] Compiling source4/param/share_classic.c
[2338/4194] Compiling source4/param/share_ldb.c
[2339/4194] Linking bin/default/source4/dns_server/libdnsserver-common-sa=
mba4.so
[2340/4194] Compiling bin/default/source4/param/shares.empty.c
[2341/4194] Compiling lib/ldb/pyldb_util.c
[2342/4194] Linking bin/default/source4/param/libshares-samba4.so
[2343/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_index.c
[2344/4194] Compiling lib/ldb/ldb_key_value/ldb_kv.c
[2345/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_search.c
[2346/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_cache.c
[2347/4194] Linking bin/default/lib/ldb/libpyldb-util.cpython-36m-x86-64-=
linux-gnu.so
[2348/4194] Compiling source4/lib/cmdline/popt_common.c
[2349/4194] Linking bin/default/lib/ldb/libldb-key-value-samba4.so
[2350/4194] Compiling bin/default/librpc/gen_ndr/ndr_drsuapi_c.c
[2351/4194] Compiling source4/lib/cmdline/credentials.c
[2352/4194] Compiling bin/default/source4/lib/registry/tdr_regf.c
[2353/4194] Compiling source4/lib/registry/patchfile_preg.c
[2354/4194] Compiling source4/lib/registry/rpc.c
[2355/4194] Compiling source4/lib/registry/local.c
[2356/4194] Compiling source4/lib/registry/hive.c
[2357/4194] Linking bin/default/source4/lib/cmdline/libcmdline-credential=
s-samba4.so
[2358/4194] Compiling source4/lib/registry/interface.c
[2359/4194] Compiling source4/lib/registry/samba.c
[2360/4194] Compiling source4/lib/registry/util.c
[2361/4194] Compiling source4/lib/registry/patchfile_dotreg.c
[2362/4194] Compiling source4/lib/registry/patchfile.c
[2363/4194] Compiling source4/lib/registry/ldb.c
[2364/4194] Compiling source4/lib/registry/regf.c
[2365/4194] Compiling lib/tdr/tdr.c
[2366/4194] Linking bin/default/source4/lib/registry/libregistry-samba4.s=
o
[2367/4194] Compiling bin/default/source4/librpc/dcerpc-samr.empty.c
[2368/4194] Compiling libgpo/gpo_ldap.c
[2369/4194] Compiling libgpo/gpext/gpext.c
[2370/4194] Compiling libgpo/gpo_sec.c
[2371/4194] Compiling libgpo/gpo_filesync.c
[2372/4194] Compiling libgpo/gpo_fetch.c
[2373/4194] Linking bin/default/source4/librpc/libdcerpc-samr.so
[2374/4194] Compiling libgpo/gpo_util.c
[2375/4194] Compiling libgpo/gpo_ini.c
[2376/4194] Compiling libgpo/gpo_reg.c
[2377/4194] Linking bin/default/libgpo/libgpo-samba4.so
[2378/4194] Compiling source4/lib/samba3/smbpasswd.c
[2379/4194] Compiling source4/lib/cmdline/popt_credentials.c
[2380/4194] Compiling source4/rpc_server/common/share_info.c
[2381/4194] Compiling source4/ntvfs/ntvfs_generic.c
[2382/4194] Compiling source4/ntvfs/ntvfs_base.c
[2383/4194] Compiling source4/ntvfs/ntvfs_util.c
[2384/4194] Linking bin/default/source4/lib/samba3/libsmbpasswdparser-sam=
ba4.so
[2385/4194] Compiling source4/ntvfs/ntvfs_interface.c
[2386/4194] Compiling source4/ntvfs/posix/pvfs_acl.c
[2387/4194] Compiling source4/ntvfs/posix/pvfs_acl_xattr.c
[2388/4194] Compiling source4/ntvfs/posix/pvfs_acl_nfs4.c
[2389/4194] Compiling source4/ntvfs/posix/pvfs_ioctl.c
[2390/4194] Compiling source4/ntvfs/posix/pvfs_sys.c
[2391/4194] Compiling source4/ntvfs/posix/pvfs_flush.c
[2392/4194] Compiling source4/ntvfs/posix/pvfs_setfileinfo.c
[2393/4194] Compiling source4/ntvfs/posix/pvfs_qfileinfo.c
[2394/4194] Compiling source4/ntvfs/posix/pvfs_wait.c
[2395/4194] Compiling source4/ntvfs/posix/pvfs_notify.c
[2396/4194] Compiling source4/ntvfs/posix/pvfs_xattr.c
[2397/4194] Compiling source4/ntvfs/posix/pvfs_mkdir.c
[2398/4194] Compiling source4/ntvfs/posix/pvfs_util.c
[2399/4194] Compiling source4/ntvfs/posix/pvfs_oplock.c
[2400/4194] Compiling source4/ntvfs/posix/pvfs_streams.c
[2401/4194] Compiling source4/ntvfs/posix/pvfs_shortname.c
[2402/4194] Compiling source4/ntvfs/posix/pvfs_rename.c
[2403/4194] Compiling source4/ntvfs/posix/pvfs_fsinfo.c
[2404/4194] Compiling source4/ntvfs/posix/pvfs_read.c
[2405/4194] Compiling source4/ntvfs/posix/pvfs_open.c
[2406/4194] Compiling source4/ntvfs/posix/vfs_posix.c
[2407/4194] Compiling source4/ntvfs/posix/pvfs_unlink.c
[2408/4194] Compiling source4/ntvfs/posix/pvfs_dirlist.c
[2409/4194] Compiling source4/ntvfs/posix/pvfs_fileinfo.c
[2410/4194] Compiling source4/ntvfs/posix/pvfs_search.c
[2411/4194] Compiling source4/ntvfs/posix/pvfs_seek.c
[2412/4194] Compiling source4/ntvfs/posix/xattr_system.c
[2413/4194] Compiling source4/ntvfs/posix/pvfs_lock.c
[2414/4194] Compiling source4/ntvfs/posix/pvfs_resolve.c
[2415/4194] Compiling source4/ntvfs/posix/pvfs_write.c
[2416/4194] Compiling source4/ntvfs/common/opendb.c
[2417/4194] Compiling source4/ntvfs/common/brlock.c
[2418/4194] Compiling source4/ntvfs/common/notify.c
[2419/4194] Compiling source4/ntvfs/common/opendb_tdb.c
[2420/4194] Compiling source4/ntvfs/common/brlock_tdb.c
[2421/4194] Compiling source4/ntvfs/common/init.c
[2422/4194] Compiling source4/ntvfs/unixuid/vfs_unixuid.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/ntvfs/unixuid/vfs_unixuid.c: In function =E2=80=98unixuid=
_connect=E2=80=99:
=2E./../source4/ntvfs/unixuid/vfs_unixuid.c:248:2: warning: =E2=80=98teve=
nt_loop_set_nesting_hook=E2=80=99 is deprecated [-Wdeprecated-declaration=
s]
  tevent_loop_set_nesting_hook(ntvfs->ctx->event_ctx,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/ntvfs/unixuid/vfs_unixuid.c:30:0:
=2E./../lib/tevent/tevent.h:2086:6: note: declared here
 void tevent_loop_set_nesting_hook(struct tevent_context *ev,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2423/4194] Compiling source4/ntvfs/sysdep/inotify.c
[2424/4194] Compiling source4/ntvfs/sysdep/sys_notify.c
[2425/4194] Compiling source4/ntvfs/sysdep/sys_lease_linux.c
[2426/4194] Compiling source4/ntvfs/sysdep/sys_lease.c
[2427/4194] Compiling source4/ntvfs/cifs/vfs_cifs.c
[2428/4194] Compiling source4/ntvfs/simple/vfs_simple.c
[2429/4194] Compiling source4/ntvfs/simple/svfs_util.c
[2430/4194] Compiling source4/ntvfs/ipc/rap_server.c
[2431/4194] Compiling source4/ntvfs/ipc/vfs_ipc.c
[2432/4194] Compiling source4/ntvfs/ipc/ipc_rap.c
[2433/4194] Linking bin/default/source4/ntvfs/libntvfs-samba4.so
[2434/4194] Compiling source3/winbindd/idmap_util.c
[2435/4194] Compiling source3/winbindd/idmap.c
[2436/4194] Compiling source3/winbindd/idmap_rw.c
[2437/4194] Compiling source3/winbindd/idmap_tdb_common.c
[2438/4194] Compiling source3/winbindd/idmap_passdb.c
[2439/4194] Compiling source3/winbindd/idmap_ldap.c
[2440/4194] Compiling source3/winbindd/idmap_nss.c
[2441/4194] Compiling source3/winbindd/idmap_tdb.c
[2442/4194] Linking bin/default/source3/winbindd/libidmap-samba4.so
[2443/4194] Compiling lib/ldb/tools/ldbutil.c
[2444/4194] Compiling lib/ldb/tools/cmdline.c
[2445/4194] Compiling source3/lib/popt_common_cmdline.c
[2446/4194] Compiling source4/heimdal/lib/ntlm/ntlm.c
[2447/4194] Compiling lib/ldb/ldb_tdb/ldb_tdb.c
[2448/4194] Compiling lib/ldb/ldb_tdb/ldb_tdb_wrap.c
[2449/4194] Linking bin/default/lib/ldb/libldb-cmdline-samba4.so
[2450/4194] Compiling libcli/smbreadline/smbreadline.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../libcli/smbreadline/smbreadline.c: In function =E2=80=98smb_readli=
ne=E2=80=99:
=2E./../libcli/smbreadline/smbreadline.c:139:3: warning: =E2=80=98CPPFunc=
tion=E2=80=99 is deprecated [-Wdeprecated-declarations]
   rl_attempted_completion_function =3D RL_COMPLETION_CAST completion_fn;=

   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2451/4194] Linking bin/default/source3/libpopt-samba3-cmdline-samba4.so
[2452/4194] Linking bin/default/source4/heimdal_build/libheimntlm-samba4.=
so
[2453/4194] Linking bin/default/lib/ldb/libldb-tdb-int-samba4.so
[2454/4194] Compiling source3/winbindd/nss_info.c
[2455/4194] Compiling source3/winbindd/nss_info_template.c
[2456/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_hdb_asn1.=
c
[2457/4194] Compiling source4/heimdal/lib/hdb/keys.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hdb/keys.c:42:1: warning: no previous prototy=
pe for =E2=80=98hdb_free_keys=E2=80=99 [-Wmissing-prototypes]
 hdb_free_keys(krb5_context context, int len, Key *keys)
 ^~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hdb/keys.c:209:1: warning: no previous protot=
ype for =E2=80=98hdb_add_current_keys_to_history=E2=80=99 [-Wmissing-prot=
otypes]
 hdb_add_current_keys_to_history(krb5_context context, hdb_entry *entry)
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hdb/keys.c:359:1: warning: no previous protot=
ype for =E2=80=98hdb_generate_key_set=E2=80=99 [-Wmissing-prototypes]
 hdb_generate_key_set(krb5_context context, krb5_principal principal,
 ^~~~~~~~~~~~~~~~~~~~
=2E./../source4/heimdal/lib/hdb/keys.c:472:1: warning: no previous protot=
ype for =E2=80=98hdb_generate_key_set_password=E2=80=99 [-Wmissing-protot=
ypes]
 hdb_generate_key_set_password(krb5_context context,
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2458/4194] Compiling source4/heimdal/lib/hdb/hdb-keytab.c
[2459/4194] Compiling source4/heimdal/lib/hdb/ext.c
[2460/4194] Linking bin/default/source3/winbindd/libnss-info-samba4.so
[2461/4194] Compiling source4/heimdal_build/hdb-glue.c
[2462/4194] Compiling source4/heimdal/lib/hdb/ndbm.c
[2463/4194] Compiling source4/heimdal/lib/hdb/mkey.c
[2464/4194] Compiling source4/heimdal/lib/hdb/hdb.c
[2465/4194] Compiling source4/heimdal/lib/hdb/dbinfo.c
[2466/4194] Compiling bin/default/source4/heimdal/lib/hdb/hdb_err.c
[2467/4194] Compiling source4/heimdal/lib/hdb/db.c
[2468/4194] Compiling source4/heimdal/lib/hdb/keytab.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/lib/hdb/keytab.c:424:1: warning: missing initiali=
zer for field =E2=80=98data=E2=80=99 of =E2=80=98krb5_kt_ops {aka struct =
krb5_keytab_data}=E2=80=99 [-Wmissing-field-initializers]
 };
 ^
In file included from ../../source4/heimdal/lib/hdb/hdb_locl.h:66:0,
                 from ../../source4/heimdal/lib/hdb/keytab.c:34:
=2E./../source4/heimdal/lib/krb5/krb5.h:584:11: note: =E2=80=98data=E2=80=
=99 declared here
     void *data;
           ^~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2469/4194] Linking bin/default/source4/heimdal_build/libhdb-samba4.so
[2470/4194] Compiling source4/param/provision.c
[2471/4194] Compiling source4/param/pyparam.c
[2472/4194] Compiling source4/libnet/libnet.c
[2473/4194] Compiling source4/libnet/prereq_domain.c
[2474/4194] Compiling source4/libnet/groupman.c
[2475/4194] Compiling source4/libnet/userman.c
[2476/4194] Compiling source4/libnet/groupinfo.c
[2477/4194] Compiling source4/libnet/userinfo.c
[2478/4194] Compiling source4/libnet/libnet_domain.c
[2479/4194] Compiling source4/libnet/libnet_lookup.c
[2480/4194] Compiling source4/libnet/libnet_share.c
[2481/4194] Compiling source4/libnet/libnet_group.c
[2482/4194] Compiling source4/libnet/libnet_user.c
[2483/4194] Compiling source4/libnet/libnet_vampire.c
[2484/4194] Compiling source4/libnet/libnet_unbecome_dc.c
[2485/4194] Compiling source4/libnet/libnet_become_dc.c
[2486/4194] Compiling source4/libnet/libnet_site.c
[2487/4194] Compiling source4/libnet/libnet_join.c
[2488/4194] Compiling source4/libnet/libnet_rpc.c
[2489/4194] Compiling source4/libnet/libnet_time.c
[2490/4194] Compiling source4/libnet/libnet_passwd.c
[2491/4194] Compiling libcli/samsync/decrypt.c
[2492/4194] Linking bin/default/source4/libnet/libsamba-net.cpython-36m-x=
86-64-linux-gnu-samba4.so
[2493/4194] Compiling source4/dsdb/samdb/ldb_modules/audit_util.c
[2494/4194] Compiling libgpo/gpext/gpext.c
[2495/4194] Compiling source4/kdc/sdb.c
[2496/4194] Compiling source4/kdc/db-glue.c
[2497/4194] Compiling source4/rpc_server/common/sid_helper.c
[2498/4194] Compiling source4/rpc_server/common/loadparm.c
[2499/4194] Compiling source4/rpc_server/common/forward.c
[2500/4194] Linking bin/default/libgpo/libgpext-samba4.so
[2501/4194] Linking bin/default/source4/kdc/libdb-glue-samba4.so
[2502/4194] Compiling source4/rpc_server/common/server_info.c
[2503/4194] Compiling source4/rpc_server/common/reply.c
[2504/4194] Compiling source4/rpc_server/handles.c
[2505/4194] Compiling source4/rpc_server/dcesrv_mgmt.c
[2506/4194] Compiling source4/rpc_server/dcesrv_auth.c
[2507/4194] Compiling source4/rpc_server/dcerpc_server.c
[2508/4194] Compiling source4/rpc_server/echo/rpc_echo.c
[2509/4194] Compiling source4/rpc_server/epmapper/rpc_epmapper.c
[2510/4194] Compiling source4/rpc_server/remote/dcesrv_remote.c
[2511/4194] Compiling source4/rpc_server/srvsvc/srvsvc_ntvfs.c
[2512/4194] Compiling source4/rpc_server/srvsvc/dcesrv_srvsvc.c
[2513/4194] Compiling source4/rpc_server/wkssvc/dcesrv_wkssvc.c
[2514/4194] Compiling source4/rpc_server/unixinfo/dcesrv_unixinfo.c
[2515/4194] Compiling source4/rpc_server/samr/dcesrv_samr.c
[2516/4194] Compiling source4/rpc_server/samr/samr_password.c
[2517/4194] Compiling source4/rpc_server/winreg/rpc_winreg.c
[2518/4194] Compiling source4/rpc_server/netlogon/dcerpc_netlogon.c
[2519/4194] Compiling source4/rpc_server/lsa/lsa_lookup.c
[2520/4194] Compiling source4/rpc_server/lsa/lsa_init.c
[2521/4194] Compiling source4/rpc_server/lsa/dcesrv_lsa.c
[2522/4194] Compiling source4/rpc_server/backupkey/dcesrv_backupkey.c
[2523/4194] Compiling source4/rpc_server/drsuapi/dcesrv_drsuapi.c
[2524/4194] Compiling source4/rpc_server/drsuapi/getncchanges.c
[2525/4194] Compiling source4/rpc_server/drsuapi/drsutil.c
[2526/4194] Compiling source4/rpc_server/drsuapi/writespn.c
[2527/4194] Compiling source4/rpc_server/drsuapi/addentry.c
[2528/4194] Compiling source4/rpc_server/drsuapi/updaterefs.c
[2529/4194] Compiling source4/rpc_server/browser/dcesrv_browser.c
[2530/4194] Compiling source4/rpc_server/eventlog/dcesrv_eventlog6.c
[2531/4194] Compiling source4/rpc_server/dnsserver/dnsdb.c
[2532/4194] Compiling source4/rpc_server/dnsserver/dnsdata.c
[2533/4194] Compiling source4/rpc_server/dnsserver/dnsutils.c
[2534/4194] Compiling source4/rpc_server/dnsserver/dcerpc_dnsserver.c
[2535/4194] Compiling bin/default/librpc/gen_ndr/ndr_backupkey_c.c
[2536/4194] Linking bin/default/source4/rpc_server/libdcerpc-server.so
[2537/4194] Compiling auth/credentials/pycredentials.c
[2538/4194] Compiling bin/default/librpc/gen_ndr/ndr_dssetup_c.c
[2539/4194] Compiling source3/winbindd/idmap_ad.c
[2540/4194] Compiling source3/winbindd/idmap_ad_nss.c
[2541/4194] Compiling lib/ldb/ldb_tdb/ldb_tdb_init.c
[2542/4194] Compiling lib/ldb/ldb_mdb/ldb_mdb.c
[2543/4194] Compiling source4/dsdb/kcc/garbage_collect_tombstones.c
[2544/4194] Compiling source4/dsdb/kcc/scavenge_dns_records.c
[2545/4194] Compiling source4/lib/registry/tools/common.c
[2546/4194] Compiling bin/default/librpc/gen_ndr/ndr_winspool_c.c
[2547/4194] Linking bin/default/lib/ldb/libldb_module_tdb.so
[2548/4194] Linking bin/default/lib/ldb/libldb-mdb-int-samba4.so
[2549/4194] Linking bin/default/source4/dsdb/libdsdb-garbage-collect-tomb=
stones-samba4.so
[2550/4194] Linking bin/default/source4/dsdb/libscavenge-dns-records-samb=
a4.so
[2551/4194] Compiling bin/default/librpc/gen_ndr/ndr_witness_c.c
[2552/4194] Compiling source3/lib/xattr_tdb.c
[2553/4194] Compiling source3/utils/passwd_util.c
[2554/4194] Compiling source4/lib/policy/gp_ini.c
[2555/4194] Compiling source4/lib/policy/gp_manage.c
[2556/4194] Compiling source4/lib/policy/gp_filesys.c
[2557/4194] Compiling source4/lib/policy/gp_ldap.c
[2558/4194] Linking bin/default/source3/libxattr-tdb-samba4.so
[2559/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_kx509_asn=
1.c
[2560/4194] Linking bin/default/source4/lib/policy/libsamba-policy.cpytho=
n-36m-x86-64-linux-gnu.so
[2561/4194] Compiling bin/default/source4/heimdal/lib/asn1/asn1_digest_as=
n1.c
[2562/4194] Compiling source4/heimdal/kdc/misc.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/kdc/misc.c: In function =E2=80=98_kdc_get_preferr=
ed_key=E2=80=99:
=2E./../source4/heimdal/kdc/misc.c:167:19: warning: comparison between =E2=
=80=98krb5_enctype {aka const enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
  for (i =3D 0; p[i] !=3D ETYPE_NULL; i++) {
                   ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2563/4194] Compiling source4/heimdal/kdc/log.c
[2564/4194] Compiling source4/heimdal/kdc/pkinit.c
[2565/4194] Compiling source4/heimdal/kdc/windc.c
[2566/4194] Compiling source4/heimdal/kdc/digest.c
[2567/4194] Compiling source4/heimdal/kdc/kx509.c
[2568/4194] Compiling source4/heimdal/kdc/default_config.c
[2569/4194] Compiling source4/heimdal/kdc/kerberos5.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/heimdal/kdc/kerberos5.c: In function =E2=80=98_kdc_is_wea=
k_exception=E2=80=99:
=2E./../source4/heimdal/kdc/kerberos5.c:95:9: warning: comparison between=
 =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <ano=
nymous>=E2=80=99 [-Wenum-compare]
  (etype =3D=3D ETYPE_DES_CBC_CRC
         ^~
=2E./../source4/heimdal/kdc/kerberos5.c:96:12: warning: comparison betwee=
n =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <an=
onymous>=E2=80=99 [-Wenum-compare]
   || etype =3D=3D ETYPE_DES_CBC_MD4
            ^~
=2E./../source4/heimdal/kdc/kerberos5.c:97:12: warning: comparison betwee=
n =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <an=
onymous>=E2=80=99 [-Wenum-compare]
   || etype =3D=3D ETYPE_DES_CBC_MD5))
            ^~
=2E./../source4/heimdal/kdc/kerberos5.c: In function =E2=80=98_kdc_find_e=
type=E2=80=99:
=2E./../source4/heimdal/kdc/kerberos5.c:162:19: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka const enum ENCTYPE}=E2=80=99 and =E2=80=98e=
num <anonymous>=E2=80=99 [-Wenum-compare]
  for (i =3D 0; p[i] !=3D ETYPE_NULL && enctype =3D=3D ETYPE_NULL; i++) {=

                   ^~
=2E./../source4/heimdal/kdc/kerberos5.c:162:44: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
  for (i =3D 0; p[i] !=3D ETYPE_NULL && enctype =3D=3D ETYPE_NULL; i++) {=

                                            ^~
=2E./../source4/heimdal/kdc/kerberos5.c:167:37: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
      for (j =3D 0; j < len && enctype =3D=3D ETYPE_NULL; j++) {
                                     ^~
=2E./../source4/heimdal/kdc/kerberos5.c:171:18: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
   if (clientbest =3D=3D ETYPE_NULL)
                  ^~
=2E./../source4/heimdal/kdc/kerberos5.c:182:17: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
  if (clientbest !=3D ETYPE_NULL && enctype =3D=3D ETYPE_NULL)
                 ^~
=2E./../source4/heimdal/kdc/kerberos5.c:182:42: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
  if (clientbest !=3D ETYPE_NULL && enctype =3D=3D ETYPE_NULL)
                                          ^~
=2E./../source4/heimdal/kdc/kerberos5.c:184:19: warning: comparison betwe=
en =E2=80=98krb5_enctype {aka enum ENCTYPE}=E2=80=99 and =E2=80=98enum <a=
nonymous>=E2=80=99 [-Wenum-compare]
  else if (enctype =3D=3D ETYPE_NULL)
                   ^~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2570/4194] Compiling source4/heimdal/kdc/krb5tgs.c
[2571/4194] Compiling source4/heimdal/kdc/process.c
[2572/4194] Linking bin/default/source4/heimdal_build/libkdc-samba4.so
[2573/4194] Compiling lib/replace/tests/getifaddrs.c
[2574/4194] Compiling lib/replace/tests/strptime.c
[2575/4194] Compiling lib/replace/tests/testsuite.c
[2576/4194] Compiling lib/replace/tests/os2_delete.c
[2577/4194] Compiling lib/printer_driver/printer_driver.c
[2578/4194] Compiling bin/default/librpc/gen_ndr/py_netlogon.c
[2579/4194] Compiling source4/auth/pyauth.c
[2580/4194] Compiling lib/torture/simple.c
[2581/4194] Compiling lib/torture/torture.c
[2582/4194] Compiling lib/torture/subunit.c
[2583/4194] Linking bin/default/lib/printer_driver/libprinter-driver-samb=
a4.so
[2584/4194] Compiling source4/dns_server/dlz_bind9.c
[2585/4194] Compiling source4/smb_server/blob.c
[2586/4194] Linking bin/default/lib/torture/libtorture-samba4.so
[2587/4194] Compiling source4/smb_server/session.c
[2588/4194] Compiling source4/smb_server/handle.c
[2589/4194] Compiling source4/smb_server/smb_server.c
[2590/4194] Linking bin/default/source4/dns_server/libdlz-bind9-for-tortu=
re-samba4.so
[2591/4194] Compiling source4/smb_server/tcon.c
[2592/4194] Compiling source4/smb_server/management.c
[2593/4194] Compiling source4/smb_server/smb/srvtime.c
[2594/4194] Compiling source4/smb_server/smb/signing.c
[2595/4194] Compiling source4/smb_server/smb/trans2.c
[2596/4194] Compiling source4/smb_server/smb/sesssetup.c
[2597/4194] Compiling source4/smb_server/smb/service.c
[2598/4194] Compiling source4/smb_server/smb/request.c
[2599/4194] Compiling source4/smb_server/smb/reply.c
[2600/4194] Compiling source4/smb_server/smb/nttrans.c
[2601/4194] Compiling source4/smb_server/smb/search.c
[2602/4194] Compiling source4/smb_server/smb/receive.c
[2603/4194] Compiling source4/smb_server/smb/negprot.c
[2604/4194] Compiling source4/smb_server/smb2/negprot.c
[2605/4194] Compiling source4/smb_server/smb2/keepalive.c
[2606/4194] Compiling source4/smb_server/smb2/find.c
[2607/4194] Compiling source4/smb_server/smb2/fileinfo.c
[2608/4194] Compiling source4/smb_server/smb2/fileio.c
[2609/4194] Compiling source4/smb_server/smb2/tcon.c
[2610/4194] Compiling source4/smb_server/smb2/sesssetup.c
[2611/4194] Compiling source4/smb_server/smb2/receive.c
[2612/4194] Compiling source4/nbt_server/wins/winsdb.c
[2613/4194] Compiling source4/nbt_server/wins/wins_hook.c
[2614/4194] Compiling source4/utils/oLschema2ldif/lib.c
[2615/4194] Compiling bin/default/librpc/gen_ndr/ndr_unixinfo_c.c
[2616/4194] Compiling bin/default/librpc/gen_ndr/ndr_fsrvp_c.c
[2617/4194] Compiling bin/default/librpc/gen_ndr/ndr_clusapi_c.c
[2618/4194] Compiling source4/libcli/util/clilsa.c
[2619/4194] Compiling source4/libcli/wrepl/winsrepl.c
[2620/4194] Compiling lib/mscat/mscat_pkcs7.c
[2621/4194] Compiling lib/mscat/mscat_ctl.c
[2622/4194] Compiling bin/default/lib/mscat/mscat_asn1_tab.c
[2623/4194] Compiling source4/kdc/hdb-samba4-plugin.c
[2624/4194] Compiling source4/kdc/hdb-samba4.c
[2625/4194] Compiling source4/kdc/sdb_to_hdb.c
[2626/4194] Linking bin/default/lib/mscat/libmscat-samba4.so
[2627/4194] Compiling source4/kdc/pac-glue.c
[2628/4194] Compiling bin/default/source4/kdc/pac.empty.c
[2629/4194] Linking bin/default/source4/kdc/libHDB-SAMBA4-samba4.so
[2630/4194] Compiling source3/lib/tldap_gensec_bind.c
[2631/4194] Compiling source3/lib/tldap_util.c
[2632/4194] Compiling source3/lib/tldap.c
[2633/4194] Linking bin/default/source4/kdc/libpac-samba4.so
[2634/4194] Compiling source3/modules/nfs4_acls.c
[2635/4194] Compiling source3/modules/posixacl_xattr.c
[2636/4194] Compiling source3/modules/string_replace.c
[2637/4194] Compiling source3/winbindd/idmap_hash/mapfile.c
[2638/4194] Compiling source3/winbindd/idmap_hash/idmap_hash.c
[2639/4194] Compiling source3/winbindd/idmap_autorid_tdb.c
[2640/4194] Compiling source3/utils/conn_tdb.c
[2641/4194] Linking bin/default/source4/librpc/python-netlogon.cpython-36=
m-x86_64-linux-gnu.so
[2642/4194] Linking bin/default/source4/auth/pyauth.cpython-36m-x86_64-li=
nux-gnu.so
[2643/4194] Linking bin/default/auth/credentials/pycredentials.cpython-36=
m-x86_64-linux-gnu.so
[2644/4194] Compiling nsswitch/winbind_nss_linux.c
[2645/4194] Compiling nsswitch/winbind_nss_linux.c
[2646/4194] Compiling nsswitch/wins.c
[2647/4194] Compiling lib/replace/tests/main.c
[2648/4194] Compiling lib/talloc/pytalloc.c
[2649/4194] Compiling lib/talloc/test_pytalloc.c
[2650/4194] Linking bin/default/nsswitch/libnss-wrapper-winbind.so
[2651/4194] Linking bin/default/nsswitch/libnss_winbind.so
[2652/4194] Linking bin/default/nsswitch/libnss_wins.so
[2653/4194] Linking bin/default/lib/replace/replace_testsuite
[2654/4194] Linking bin/default/lib/talloc/pytalloc.cpython-36m-x86_64-li=
nux-gnu.so
[2655/4194] Linking bin/default/lib/talloc/test-pytalloc.cpython-36m-x86_=
64-linux-gnu.so
[2656/4194] Compiling lib/tevent/pytevent.c
[2657/4194] Compiling lib/texpect/texpect.c
[2658/4194] Compiling lib/tdb/tools/tdbtorture.c
[2659/4194] Compiling lib/tdb/tools/tdbrestore.c
[2660/4194] Compiling lib/tdb/tools/tdbdump.c
[2661/4194] Compiling lib/tdb/tools/tdbbackup.c
[2662/4194] Linking bin/default/lib/tevent/-tevent.cpython-36m-x86_64-lin=
ux-gnu.so
[2663/4194] Linking bin/default/lib/texpect/texpect
[2664/4194] Linking bin/default/lib/tdb/tdbtorture
[2665/4194] Linking bin/default/lib/tdb/tdbrestore
[2666/4194] Linking bin/default/lib/tdb/tdbdump
[2667/4194] Linking bin/default/lib/tdb/tdbbackup
[2668/4194] Compiling lib/tdb/tools/tdbtool.c
[2669/4194] Compiling lib/tdb/pytdb.c
[2670/4194] Compiling lib/ldb/pyldb.c
[2671/4194] Compiling lib/ldb/modules/asq.c
[2672/4194] Compiling lib/ldb/modules/sort.c
[2673/4194] Compiling lib/ldb/modules/paged_searches.c
[2674/4194] Linking bin/default/lib/tdb/tdbtool
[2675/4194] Linking bin/default/lib/tdb/pytdb.cpython-36m-x86_64-linux-gn=
u.so
[2676/4194] Linking bin/default/lib/ldb/pyldb.cpython-36m-x86_64-linux-gn=
u.so
[2677/4194] Linking bin/default/lib/ldb/libldb_module_asq.so
[2678/4194] Linking bin/default/lib/ldb/libldb_module_server_sort.so
[2679/4194] Linking bin/default/lib/ldb/libldb_module_paged_searches.so
[2680/4194] Compiling lib/ldb/modules/rdn_name.c
[2681/4194] Compiling lib/ldb/tests/sample_module.c
[2682/4194] Compiling lib/ldb/modules/skel.c
[2683/4194] Compiling lib/ldb/ldb_mdb/ldb_mdb_init.c
[2684/4194] Compiling lib/ldb/ldb_ldb/ldb_ldb.c
[2685/4194] Compiling lib/ldb/tools/ldbadd.c
[2686/4194] Linking bin/default/lib/ldb/libldb_module_rdn_name.so
[2687/4194] Linking bin/default/lib/ldb/libldb_module_sample.so
[2688/4194] Linking bin/default/lib/ldb/libldb_module_skel.so
[2689/4194] Linking bin/default/lib/ldb/libldb_module_mdb.so
[2690/4194] Linking bin/default/lib/ldb/libldb_module_ldb.so
[2691/4194] Linking bin/default/lib/ldb/ldbadd
[2692/4194] Compiling lib/ldb/tools/ldbsearch.c
[2693/4194] Compiling lib/ldb/tools/ldbdel.c
[2694/4194] Compiling lib/ldb/tools/ldbmodify.c
[2695/4194] Compiling lib/ldb/tools/ldbedit.c
[2696/4194] Compiling lib/ldb/tools/ldbrename.c
[2697/4194] Compiling lib/ldb/tools/ldbtest.c
[2698/4194] Linking bin/default/lib/ldb/ldbsearch
[2699/4194] Linking bin/default/lib/ldb/ldbdel
[2700/4194] Linking bin/default/lib/ldb/ldbmodify
[2701/4194] Linking bin/default/lib/ldb/ldbedit
[2702/4194] Linking bin/default/lib/ldb/ldbrename
[2703/4194] Linking bin/default/lib/ldb/ldbtest
[2704/4194] Compiling lib/ldb/tools/ldbdump.c
[2705/4194] Compiling lib/ldb/tests/ldb_mod_op_test.c
[2706/4194] Compiling lib/ldb/tests/ldb_mod_op_test.c
[2707/4194] Compiling lib/ldb/tests/ldb_kv_ops_test.c
[2708/4194] Compiling lib/ldb/tests/ldb_tdb_test.c
[2709/4194] Compiling lib/ldb/tests/ldb_msg.c
[2710/4194] Linking bin/default/lib/ldb/ldbdump
[2711/4194] Linking bin/default/lib/ldb/ldb_tdb_mod_op_test
[2712/4194] Linking bin/default/lib/ldb/ldb_tdb_guid_mod_op_test
[2713/4194] Linking bin/default/lib/ldb/ldb_tdb_kv_ops_test
[2714/4194] Linking bin/default/lib/ldb/ldb_tdb_test
[2715/4194] Linking bin/default/lib/ldb/ldb_msg_test
[2716/4194] Compiling lib/ldb/tests/test_ldb_qsort.c
[2717/4194] Compiling lib/ldb/tests/test_ldb_dn.c
[2718/4194] Compiling lib/ldb/tests/ldb_match_test.c
[2719/4194] Compiling lib/ldb/tests/ldb_key_value_test.c
[2720/4194] Compiling lib/ldb/tests/ldb_parse_test.c
[2721/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_search.c
[2722/4194] Linking bin/default/lib/ldb/test_ldb_qsort
[2723/4194] Linking bin/default/lib/ldb/test_ldb_dn
[2724/4194] Linking bin/default/lib/ldb/ldb_match_test
[2725/4194] Linking bin/default/lib/ldb/ldb_key_value_test
[2726/4194] Linking bin/default/lib/ldb/ldb_parse_test
[2727/4194] Compiling lib/ldb/tests/ldb_key_value_sub_txn_test.c
[2728/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_cache.c
[2729/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_index.c
[2730/4194] Compiling lib/ldb/tests/ldb_mod_op_test.c
[2731/4194] Compiling lib/ldb/tests/ldb_lmdb_test.c
[2732/4194] Compiling lib/ldb/tests/ldb_lmdb_size_test.c
[2733/4194] Linking bin/default/lib/ldb/ldb_key_value_sub_txn_tdb_test
[2734/4194] Compiling lib/ldb/tests/ldb_kv_ops_test.c
[2735/4194] Compiling lib/ldb/tests/ldb_key_value_sub_txn_test.c
[2736/4194] Linking bin/default/lib/ldb/ldb_mdb_mod_op_test
[2737/4194] Linking bin/default/lib/ldb/ldb_lmdb_test
[2738/4194] Linking bin/default/lib/ldb/ldb_lmdb_size_test
[2739/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_cache.c
[2740/4194] Linking bin/default/lib/ldb/ldb_mdb_kv_ops_test
[2741/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_search.c
[2742/4194] Compiling lib/ldb/ldb_key_value/ldb_kv_index.c
[2743/4194] Compiling lib/audit_logging/tests/audit_logging_test.c
[2744/4194] Compiling lib/audit_logging/tests/audit_logging_error_test.c
[2745/4194] Linking bin/default/lib/ldb/ldb_key_value_sub_txn_mdb_test
[2746/4194] Compiling python/pyglue.c
[2747/4194] Compiling source4/param/pyparam.c
[2748/4194] Compiling librpc/tools/ndrdump.c
[2749/4194] Linking bin/default/lib/audit_logging/audit_logging_test
[2750/4194] Linking bin/default/lib/audit_logging/audit_logging_error_tes=
t
[2751/4194] Compiling source4/librpc/rpc/pyrpc.c
[2752/4194] Linking bin/default/python/python-glue.cpython-36m-x86_64-lin=
ux-gnu.so
[2753/4194] Linking bin/default/source4/param/pyparam.cpython-36m-x86_64-=
linux-gnu.so
[2754/4194] Linking bin/default/librpc/tools/ndrdump
[2755/4194] Compiling bin/default/librpc/gen_ndr/py_misc.c
[2756/4194] Compiling bin/default/librpc/gen_ndr/py_auth.c
[2757/4194] Linking bin/default/source4/librpc/python-dcerpc.cpython-36m-=
x86_64-linux-gnu.so
[2758/4194] Compiling bin/default/librpc/gen_ndr/py_security.c
[2759/4194] Compiling bin/default/librpc/gen_ndr/py_lsa.c
[2760/4194] Compiling bin/default/librpc/gen_ndr/py_krb5pac.c
[2761/4194] Linking bin/default/source4/librpc/python-dcerpc-misc.cpython=
-36m-x86_64-linux-gnu.so
[2762/4194] Linking bin/default/source4/librpc/python-auth.cpython-36m-x8=
6_64-linux-gnu.so
[2763/4194] Compiling bin/default/librpc/gen_ndr/py_samr.c
[2764/4194] Linking bin/default/source4/librpc/python-dcerpc-security.cpy=
thon-36m-x86_64-linux-gnu.so
[2765/4194] Linking bin/default/source4/librpc/python-lsa.cpython-36m-x86=
_64-linux-gnu.so
[2766/4194] Linking bin/default/source4/librpc/python-krb5pac.cpython-36m=
-x86_64-linux-gnu.so
[2767/4194] Compiling bin/default/librpc/gen_ndr/py_spoolss.c
[2768/4194] Compiling bin/default/librpc/gen_ndr/py_winspool.c
[2769/4194] Linking bin/default/source4/librpc/python-samr.cpython-36m-x8=
6_64-linux-gnu.so
[2770/4194] Compiling bin/default/librpc/gen_ndr/py_witness.c
[2771/4194] Compiling bin/default/librpc/gen_ndr/py_nbt.c
[2772/4194] Compiling bin/default/librpc/gen_ndr/py_drsblobs.c
[2773/4194] Linking bin/default/source4/librpc/python-spoolss.cpython-36m=
-x86_64-linux-gnu.so
[2774/4194] Linking bin/default/source4/librpc/python-winspool.cpython-36=
m-x86_64-linux-gnu.so
[2775/4194] Compiling bin/default/librpc/gen_ndr/py_ntlmssp.c
[2776/4194] Linking bin/default/source4/librpc/python-witness.cpython-36m=
-x86_64-linux-gnu.so
[2777/4194] Linking bin/default/source4/librpc/python-dcerpc-nbt.cpython-=
36m-x86_64-linux-gnu.so
[2778/4194] Linking bin/default/source4/librpc/python-dcerpc-drsblobs.cpy=
thon-36m-x86_64-linux-gnu.so
[2779/4194] Compiling bin/default/librpc/gen_ndr/py_srvsvc.c
[2780/4194] Compiling bin/default/librpc/gen_ndr/py_echo.c
[2781/4194] Linking bin/default/source4/librpc/python-dcerpc-ntlmssp.cpyt=
hon-36m-x86_64-linux-gnu.so
[2782/4194] Compiling bin/default/librpc/gen_ndr/py_dns.c
[2783/4194] Compiling bin/default/librpc/gen_ndr/py_winreg.c
[2784/4194] Compiling bin/default/librpc/gen_ndr/py_preg.c
[2785/4194] Linking bin/default/source4/librpc/python-srvsvc.cpython-36m-=
x86_64-linux-gnu.so
[2786/4194] Linking bin/default/source4/librpc/python-echo.cpython-36m-x8=
6_64-linux-gnu.so
[2787/4194] Compiling bin/default/librpc/gen_ndr/py_initshutdown.c
[2788/4194] Linking bin/default/source4/librpc/python-dns.cpython-36m-x86=
_64-linux-gnu.so
[2789/4194] Linking bin/default/source4/librpc/python-winreg.cpython-36m-=
x86_64-linux-gnu.so
[2790/4194] Linking bin/default/source4/librpc/python-preg.cpython-36m-x8=
6_64-linux-gnu.so
[2791/4194] Compiling bin/default/librpc/gen_ndr/py_epmapper.c
[2792/4194] Compiling bin/default/librpc/gen_ndr/py_mgmt.c
[2793/4194] Linking bin/default/source4/librpc/python-initshutdown.cpytho=
n-36m-x86_64-linux-gnu.so
[2794/4194] Compiling bin/default/librpc/gen_ndr/py_atsvc.c
[2795/4194] Compiling bin/default/librpc/gen_ndr/py_svcctl.c
[2796/4194] Compiling bin/default/librpc/gen_ndr/py_wkssvc.c
[2797/4194] Linking bin/default/source4/librpc/python-epmapper.cpython-36=
m-x86_64-linux-gnu.so
[2798/4194] Linking bin/default/source4/librpc/python-mgmt.cpython-36m-x8=
6_64-linux-gnu.so
[2799/4194] Compiling bin/default/librpc/gen_ndr/py_dfs.c
[2800/4194] Linking bin/default/source4/librpc/python-atsvc.cpython-36m-x=
86_64-linux-gnu.so
[2801/4194] Linking bin/default/source4/librpc/python-svcctl.cpython-36m-=
x86_64-linux-gnu.so
[2802/4194] Linking bin/default/source4/librpc/python-wkssvc.cpython-36m-=
x86_64-linux-gnu.so
[2803/4194] Compiling bin/default/librpc/gen_ndr/py_dcerpc.c
[2804/4194] Compiling bin/default/librpc/gen_ndr/py_unixinfo.c
[2805/4194] Linking bin/default/source4/librpc/python-dfs.cpython-36m-x86=
_64-linux-gnu.so
[2806/4194] Compiling bin/default/source4/librpc/gen_ndr/py_irpc.c
[2807/4194] Compiling bin/default/librpc/gen_ndr/py_server_id.c
[2808/4194] Compiling bin/default/librpc/gen_ndr/py_winbind.c
[2809/4194] Linking bin/default/source4/librpc/python-dcerpc-dcerpc.cpyth=
on-36m-x86_64-linux-gnu.so
[2810/4194] Linking bin/default/source4/librpc/python-unixinfo.cpython-36=
m-x86_64-linux-gnu.so
[2811/4194] Compiling bin/default/librpc/gen_ndr/py_drsuapi.c
[2812/4194] Linking bin/default/source4/librpc/python-irpc.cpython-36m-x8=
6_64-linux-gnu.so
[2813/4194] Linking bin/default/source4/librpc/python-server-id.cpython-3=
6m-x86_64-linux-gnu.so
[2814/4194] Linking bin/default/source4/librpc/python-winbind.cpython-36m=
-x86_64-linux-gnu.so
[2815/4194] Compiling bin/default/librpc/gen_ndr/py_dnsp.c
[2816/4194] Compiling bin/default/librpc/gen_ndr/py_xattr.c
[2817/4194] Linking bin/default/source4/librpc/python-drsuapi.cpython-36m=
-x86_64-linux-gnu.so
[2818/4194] Compiling bin/default/librpc/gen_ndr/py_idmap.c
[2819/4194] Compiling bin/default/librpc/gen_ndr/py_dnsserver.c
[2820/4194] Compiling bin/default/librpc/gen_ndr/py_smb_acl.c
[2821/4194] Linking bin/default/source4/librpc/python-dcerpc-dnsp.cpython=
-36m-x86_64-linux-gnu.so
[2822/4194] Linking bin/default/source4/librpc/python-dcerpc-xattr.cpytho=
n-36m-x86_64-linux-gnu.so
[2823/4194] Compiling bin/default/librpc/gen_ndr/py_messaging.c
[2824/4194] Linking bin/default/source4/librpc/python-dcerpc-idmap.cpytho=
n-36m-x86_64-linux-gnu.so
[2825/4194] Linking bin/default/source4/librpc/python-dnsserver.cpython-3=
6m-x86_64-linux-gnu.so
[2826/4194] Linking bin/default/source4/librpc/python-dcerpc-smb-acl.cpyt=
hon-36m-x86_64-linux-gnu.so
[2827/4194] Compiling bin/default/librpc/gen_ndr/py_windows_event_ids.c
[2828/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_unique_ob=
ject_sids.c
[2829/4194] Linking bin/default/source4/librpc/dcerpc-python-messaging.cp=
ython-36m-x86_64-linux-gnu.so
[2830/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_encrypted=
_secrets.c
[2831/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_encrypted=
_secrets.c
[2832/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_audit_uti=
l.c
[2833/4194] Linking bin/default/source4/librpc/dcerpc-windows-event-ids.c=
python-36m-x86_64-linux-gnu.so
[2834/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_uniqu=
e_object_sids
[2835/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_audit_log=
=2Ec
[2836/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_encry=
pted_secrets_tdb
[2837/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_encry=
pted_secrets_mdb
[2838/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_audit=
_util
[2839/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_audit_log=
_errors.c
[2840/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_group_aud=
it.c
[2841/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_audit=
_log
[2842/4194] Compiling source4/dsdb/samdb/ldb_modules/tests/test_group_aud=
it_errors.c
[2843/4194] Compiling source4/dsdb/samdb/ldb_modules/samba_dsdb.c
[2844/4194] Compiling source4/dsdb/samdb/ldb_modules/samba_secrets.c
[2845/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_audit=
_log_errors
[2846/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_group=
_audit
[2847/4194] Compiling source4/dsdb/samdb/ldb_modules/objectguid.c
[2848/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/test_group=
_audit_errors
[2849/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_samba_dsdb.so
[2850/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_samba_secrets.so
[2851/4194] Compiling source4/dsdb/samdb/ldb_modules/repl_meta_data.c
[2852/4194] Compiling source4/dsdb/samdb/ldb_modules/schema_load.c
[2853/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_objectguid.so
[2854/4194] Compiling source4/dsdb/samdb/ldb_modules/schema_data.c
[2855/4194] Compiling source4/dsdb/samdb/ldb_modules/samldb.c
[2856/4194] Compiling source4/dsdb/samdb/ldb_modules/samba3sam.c
[2857/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_repl_meta_data.so
[2858/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_schema_load.so
[2859/4194] Compiling source4/dsdb/samdb/ldb_modules/samba3sid.c
[2860/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_schema_data.so
[2861/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_samldb.so
[2862/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_samba3sam.so
[2863/4194] Compiling source4/dsdb/samdb/ldb_modules/simple_ldap_map.c
[2864/4194] Compiling source4/dsdb/samdb/ldb_modules/rootdse.c
[2865/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_samba3sid.so
[2866/4194] Compiling source4/dsdb/samdb/ldb_modules/password_hash.c
[2867/4194] Compiling source4/dsdb/samdb/ldb_modules/local_password.c
[2868/4194] Compiling source4/dsdb/samdb/ldb_modules/extended_dn_in.c
[2869/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_simple_ldap_map.so
[2870/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_rootdse.so
[2871/4194] Compiling source4/dsdb/samdb/ldb_modules/extended_dn_out.c
[2872/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_password_hash.so
[2873/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_local_password.so
[2874/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_extended_dn_in.so
[2875/4194] Compiling source4/dsdb/samdb/ldb_modules/extended_dn_store.c
[2876/4194] Compiling source4/dsdb/samdb/ldb_modules/show_deleted.c
[2877/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_extended_dn_out.so
[2878/4194] Compiling source4/dsdb/samdb/ldb_modules/partition_metadata.c=

[2879/4194] Compiling source4/dsdb/samdb/ldb_modules/partition.c
[2880/4194] Compiling source4/dsdb/samdb/ldb_modules/partition_init.c
[2881/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_extended_dn_store.so
[2882/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_show_deleted.so
[2883/4194] Compiling source4/dsdb/samdb/ldb_modules/new_partition.c
[2884/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_partition.so
[2885/4194] Compiling source4/dsdb/samdb/ldb_modules/update_keytab.c
[2886/4194] Compiling source4/dsdb/samdb/ldb_modules/secrets_tdb_sync.c
[2887/4194] Compiling source4/dsdb/samdb/ldb_modules/objectclass.c
[2888/4194] Compiling source4/dsdb/samdb/ldb_modules/objectclass_attrs.c
[2889/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_new_partition.so
[2890/4194] Compiling source4/dsdb/samdb/ldb_modules/subtree_rename.c
[2891/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_update_keytab.so
[2892/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_secrets_tdb_sync.so
[2893/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_objectclass.so
[2894/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_objectclass_attrs.so
[2895/4194] Compiling source4/dsdb/samdb/ldb_modules/subtree_delete.c
[2896/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_subtree_rename.so
[2897/4194] Compiling source4/dsdb/samdb/ldb_modules/linked_attributes.c
[2898/4194] Compiling source4/dsdb/samdb/ldb_modules/ranged_results.c
[2899/4194] Compiling source4/dsdb/samdb/ldb_modules/anr.c
[2900/4194] Compiling source4/dsdb/samdb/ldb_modules/instancetype.c
[2901/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_subtree_delete.so
[2902/4194] Compiling source4/dsdb/samdb/ldb_modules/operational.c
[2903/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_linked_attributes.so
[2904/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_ranged_results.so
[2905/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_anr.so
[2906/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_instancetype.so
[2907/4194] Compiling source4/dsdb/samdb/ldb_modules/descriptor.c
[2908/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_operational.so
[2909/4194] Compiling source4/dsdb/samdb/ldb_modules/resolve_oids.c
[2910/4194] Compiling source4/dsdb/samdb/ldb_modules/acl.c
[2911/4194] Compiling source4/dsdb/samdb/ldb_modules/lazy_commit.c
[2912/4194] Compiling source4/dsdb/samdb/ldb_modules/acl_read.c
[2913/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_descriptor.so
[2914/4194] Compiling source4/dsdb/samdb/ldb_modules/simple_dn.c
[2915/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_resolve_oids.so
[2916/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_acl.so
[2917/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_lazy_commit.so
[2918/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_aclread.so
[2919/4194] Compiling source4/dsdb/samdb/ldb_modules/dirsync.c
[2920/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_simple_dn.so
[2921/4194] Compiling source4/dsdb/samdb/ldb_modules/dsdb_notification.c
[2922/4194] Compiling source4/dsdb/samdb/ldb_modules/dns_notify.c
[2923/4194] Compiling source4/dsdb/samdb/ldb_modules/tombstone_reanimate.=
c
[2924/4194] Compiling source4/dsdb/samdb/ldb_modules/vlv_pagination.c
[2925/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_dirsync.so
[2926/4194] Compiling source4/dsdb/samdb/ldb_modules/paged_results.c
[2927/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_dsdb_notification.so
[2928/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_dns_notify.so
[2929/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_tombstone_reanimate.so
[2930/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_vlv.so
[2931/4194] Compiling source4/dsdb/samdb/ldb_modules/unique_object_sids.c=

[2932/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_paged_results.so
[2933/4194] Compiling source4/dsdb/samdb/ldb_modules/encrypted_secrets.c
[2934/4194] Compiling source4/dsdb/samdb/ldb_modules/audit_log.c
[2935/4194] Compiling source4/dsdb/samdb/ldb_modules/group_audit.c
[2936/4194] Compiling source4/dsdb/samdb/ldb_modules/count_attrs.c
[2937/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_unique_object_sids.so
[2938/4194] Compiling source4/dsdb/repl/drepl_periodic.c
[2939/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_encrypted_secrets.so
[2940/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_audit_log.so
[2941/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_group_audit_log.so
[2942/4194] Linking bin/default/source4/dsdb/samdb/ldb_modules/libldb_mod=
ule_count_attrs.so
[2943/4194] Compiling source4/dsdb/repl/drepl_partitions.c
[2944/4194] Compiling source4/dsdb/repl/drepl_secret.c
[2945/4194] Compiling source4/dsdb/repl/drepl_fsmo.c
[2946/4194] Compiling source4/dsdb/repl/drepl_ridalloc.c
[2947/4194] Compiling source4/dsdb/repl/drepl_notify.c
[2948/4194] Compiling source4/dsdb/repl/drepl_out_helpers.c
[2949/4194] Compiling source4/dsdb/repl/drepl_out_pull.c
[2950/4194] Compiling source4/dsdb/repl/drepl_extended.c
[2951/4194] Compiling source4/dsdb/repl/drepl_service.c
[2952/4194] Compiling source4/dsdb/repl/drepl_replica.c
[2953/4194] Linking bin/default/source4/dsdb/libservice_module_drepl.so
[2954/4194] Compiling source4/dsdb/kcc/kcc_periodic.c
[2955/4194] Compiling source4/dsdb/kcc/kcc_connection.c
[2956/4194] Compiling source4/dsdb/kcc/kcc_drs_replica_info.c
[2957/4194] Compiling source4/dsdb/kcc/kcc_service.c
[2958/4194] Compiling source4/dsdb/dns/dns_update.c
[2959/4194] Compiling source4/dsdb/pydsdb.c
[2960/4194] Linking bin/default/source4/dsdb/libservice_module_kcc.so
[2961/4194] Compiling source4/smbd/server.c
[2962/4194] Compiling source4/smbd/process_standard.c
[2963/4194] Compiling source4/smbd/process_prefork.c
[2964/4194] Linking bin/default/source4/dsdb/libservice_module_dns_update=
=2Eso
[2965/4194] Linking bin/default/source4/dsdb/python-dsdb.cpython-36m-x86_=
64-linux-gnu.so
[2966/4194] Compiling source4/libnet/py_net.c
[2967/4194] Linking bin/default/source4/smbd/samba
[2968/4194] Linking bin/default/source4/smbd/libprocess_model_module_stan=
dard.so
[2969/4194] Linking bin/default/source4/smbd/libprocess_model_module_pref=
ork.so
[2970/4194] Compiling source4/libnet/libnet_export_keytab.c
[2971/4194] Compiling source4/libnet/py_net_dckeytab.c
[2972/4194] Linking bin/default/source4/libnet/python-net.cpython-36m-x86=
_64-linux-gnu.so
[2973/4194] Compiling source4/auth/gensec/gensec_krb5_heimdal.c
[2974/4194] Compiling source4/auth/gensec/gensec_krb5.c
[2975/4194] Compiling source4/auth/gensec/pygensec.c
[2976/4194] Linking bin/default/source4/libnet/python-dckeytab.cpython-36=
m-x86_64-linux-gnu.so
[2977/4194] Compiling source4/auth/tests/kerberos.c
[2978/4194] Compiling nsswitch/nsstest.c
[2979/4194] Linking bin/default/source4/auth/gensec/libgensec_module_krb5=
=2Eso
[2980/4194] Compiling nsswitch/stress-nss-libwbclient.c
[2981/4194] Linking bin/default/source4/auth/gensec/pygensec.cpython-36m-=
x86_64-linux-gnu.so
[2982/4194] Compiling nsswitch/pam_winbind.c
[2983/4194] Linking bin/default/source4/auth/test_kerberos
[2984/4194] Linking bin/default/nsswitch/nsstest
[2985/4194] Compiling nsswitch/krb5_plugin/winbind_krb5_locator.c
[2986/4194] Linking bin/default/nsswitch/stress-nss-libwbclient
[2987/4194] Compiling nsswitch/wbinfo.c
[2988/4194] Linking bin/default/nsswitch/libpamwinbind.so
[2989/4194] Compiling lib/ldb-samba/pyldb.c
[2990/4194] Compiling lib/ldb-samba/samba_extensions.c
[2991/4194] Linking bin/default/nsswitch/libwinbind-krb5-locator.so
[2992/4194] Compiling lib/ldb-samba/ldb_ildap.c
[2993/4194] Linking bin/default/nsswitch/wbinfo
[2994/4194] Compiling source4/lib/registry/tools/regdiff.c
[2995/4194] Linking bin/default/lib/ldb-samba/python-samba--ldb.cpython-3=
6m-x86_64-linux-gnu.so
[2996/4194] Linking bin/default/lib/ldb-samba/libldb_module_ldbsamba_exte=
nsions.so
[2997/4194] Compiling source4/lib/registry/tools/regpatch.c
[2998/4194] Linking bin/default/lib/ldb-samba/libldb_module_ildap.so
[2999/4194] Compiling source4/lib/registry/tools/regshell.c
[3000/4194] Linking bin/default/source4/lib/registry/regdiff
[3001/4194] Compiling source4/lib/registry/tools/regtree.c
[3002/4194] Compiling source4/lib/registry/tests/hive.c
[3003/4194] Linking bin/default/source4/lib/registry/regpatch
[3004/4194] Compiling source4/lib/registry/tests/diff.c
[3005/4194] Linking bin/default/source4/lib/registry/regshell
[3006/4194] Compiling source4/lib/registry/tests/generic.c
[3007/4194] Linking bin/default/source4/lib/registry/regtree
[3008/4194] Compiling source4/lib/registry/tests/registry.c
[3009/4194] Compiling source4/lib/registry/pyregistry.c
[3010/4194] Compiling source4/lib/messaging/pymessaging.c
[3011/4194] Compiling third_party/socket_wrapper/socket_wrapper.c
[3012/4194] Compiling third_party/nss_wrapper/nss_wrapper.c
[3013/4194] Compiling third_party/resolv_wrapper/resolv_wrapper.c
[3014/4194] Compiling third_party/uid_wrapper/uid_wrapper.c
[3015/4194] Linking bin/default/source4/lib/registry/py-registry.cpython-=
36m-x86_64-linux-gnu.so
[3016/4194] Linking bin/default/source4/lib/messaging/python-messaging.cp=
ython-36m-x86_64-linux-gnu.so
[3017/4194] Linking bin/default/third_party/socket_wrapper/libsocket-wrap=
per.so
[3018/4194] Linking bin/default/third_party/nss_wrapper/libnss-wrapper.so=

[3019/4194] Linking bin/default/third_party/resolv_wrapper/libresolv-wrap=
per.so
[3020/4194] Linking bin/default/third_party/uid_wrapper/libuid-wrapper.so=

[3021/4194] Compiling third_party/pam_wrapper/pam_wrapper.c
[3022/4194] Compiling third_party/pam_wrapper/libpamtest.c
[3023/4194] Compiling third_party/pam_wrapper/modules/pam_set_items.c
[3024/4194] Compiling third_party/pam_wrapper/python/pypamtest.c
[3025/4194] Compiling lib/util/tests/genrandperf.c
[3026/4194] Compiling lib/util/tests/rfc1738.c
[3027/4194] Linking bin/default/third_party/pam_wrapper/libpam-wrapper.so=

[3028/4194] Linking bin/default/third_party/pam_wrapper/pypamtest.cpython=
-36m-x86_64-linux-gnu.so
[3029/4194] Linking bin/default/third_party/pam_wrapper/libpam-set-items.=
so
[3030/4194] Compiling lib/util/tests/test_ms_fnmatch.c
[3031/4194] Linking bin/default/lib/util/genrandperf
[3032/4194] Linking bin/default/lib/util/test_rfc1738
[3033/4194] Compiling lib/util/tests/test_talloc_keep_secret.c
[3034/4194] Compiling lib/util/tests/test_byteorder.c
[3035/4194] Compiling lib/crypto/md4test.c
[3036/4194] Linking bin/default/lib/util/test_ms_fnmatch
[3037/4194] Compiling lib/crypto/aes_ccm_128_test.c
[3038/4194] Compiling lib/crypto/aes_gcm_128_test.c
[3039/4194] Linking bin/default/lib/util/test_talloc_keep_secret
[3040/4194] Linking bin/default/lib/util/test_byteorder
[3041/4194] Compiling lib/crypto/aes_cmac_128_test.c
[3042/4194] Compiling lib/crypto/py_crypto.c
[3043/4194] Compiling libgpo/pygpo.c
[3044/4194] Compiling source4/dns_server/dns_update.c
[3045/4194] Compiling source4/dns_server/dns_utils.c
[3046/4194] Compiling source4/dns_server/dns_crypto.c
[3047/4194] Compiling source4/dns_server/dns_server.c
[3048/4194] Linking bin/default/lib/crypto/python-crypto.cpython-36m-x86_=
64-linux-gnu.so
[3049/4194] Linking bin/default/libgpo/python-samba-libgpo.cpython-36m-x8=
6_64-linux-gnu.so
[3050/4194] Compiling source4/dns_server/dns_query.c
[3051/4194] Linking bin/default/source4/dns_server/libservice_module_dns.=
so
[3052/4194] Compiling source4/dns_server/dlz_bind9.c
[3053/4194] Compiling source4/dns_server/dlz_bind9.c
[3054/4194] Compiling source4/dns_server/dlz_bind9.c
[3055/4194] Compiling source4/dns_server/dlz_bind9.c
[3056/4194] Compiling source4/dns_server/dlz_bind9.c
[3057/4194] Compiling source4/dns_server/pydns.c
[3058/4194] Linking bin/default/source4/dns_server/libdlz-bind9.so
[3059/4194] Linking bin/default/source4/dns_server/libdlz-bind9-9.so
[3060/4194] Linking bin/default/source4/dns_server/libdlz-bind9-10.so
[3061/4194] Linking bin/default/source4/dns_server/libdlz-bind9-11.so
[3062/4194] Linking bin/default/source4/dns_server/libdlz-bind9-12.so
[3063/4194] Linking bin/default/source4/dns_server/python-dsdb-dns.cpytho=
n-36m-x86_64-linux-gnu.so
[3064/4194] Compiling source4/smb_server/service_smb.c
[3065/4194] Compiling source4/rpc_server/service_rpc.c
[3066/4194] Compiling source4/rpc_server/tests/rpc_dns_server_dnsutils_te=
st.c
[3067/4194] Compiling source4/ldap_server/ldap_backend.c
[3068/4194] Compiling source4/ldap_server/ldap_extended.c
[3069/4194] Compiling source4/ldap_server/ldap_bind.c
[3070/4194] Linking bin/default/source4/smb_server/libservice_module_smb.=
so
[3071/4194] Linking bin/default/source4/rpc_server/libservice_module_dcer=
pc.so
[3072/4194] Linking bin/default/source4/rpc_server/test_rpc_dns_server_dn=
sutils
[3073/4194] Compiling source4/ldap_server/ldap_server.c
[3074/4194] Linking bin/default/source4/ldap_server/libservice_module_lda=
p.so
[3075/4194] Compiling source4/winbind/winbindd.c
[3076/4194] Compiling source4/nbt_server/wins/wins_ldb.c
[3077/4194] Compiling source4/nbt_server/wins/wins_dns_proxy.c
[3078/4194] Compiling source4/nbt_server/wins/winswack.c
[3079/4194] Compiling source4/nbt_server/wins/winsclient.c
[3080/4194] Compiling source4/nbt_server/wins/winsserver.c
[3081/4194] Linking bin/default/source4/winbind/libservice_module_winbind=
d.so
[3082/4194] Linking bin/default/source4/nbt_server/libldb_module_wins_ldb=
=2Eso
[3083/4194] Compiling source4/nbt_server/dgram/request.c
[3084/4194] Compiling source4/nbt_server/dgram/netlogon.c
[3085/4194] Compiling source4/nbt_server/dgram/browse.c
[3086/4194] Compiling source4/nbt_server/nodestatus.c
[3087/4194] Compiling source4/nbt_server/packet.c
[3088/4194] Compiling source4/nbt_server/register.c
[3089/4194] Compiling source4/nbt_server/irpc.c
[3090/4194] Compiling source4/nbt_server/defense.c
[3091/4194] Compiling source4/nbt_server/query.c
[3092/4194] Compiling source4/nbt_server/interfaces.c
[3093/4194] Compiling source4/nbt_server/nbt_server.c
[3094/4194] Linking bin/default/source4/nbt_server/libservice_module_nbtd=
=2Eso
[3095/4194] Compiling source4/wrepl_server/wrepl_in_call.c
[3096/4194] Compiling source4/wrepl_server/wrepl_server.c
[3097/4194] Compiling source4/wrepl_server/wrepl_apply_records.c
[3098/4194] Compiling source4/wrepl_server/wrepl_out_helpers.c
[3099/4194] Compiling source4/wrepl_server/wrepl_periodic.c
[3100/4194] Compiling source4/wrepl_server/wrepl_in_connection.c
[3101/4194] Compiling source4/wrepl_server/wrepl_scavenging.c
[3102/4194] Compiling source4/wrepl_server/wrepl_out_push.c
[3103/4194] Compiling source4/wrepl_server/wrepl_out_pull.c
[3104/4194] Linking bin/default/source4/wrepl_server/libservice_module_wr=
epl.so
[3105/4194] Compiling source4/cldap_server/cldap_server.c
[3106/4194] Compiling source4/cldap_server/rootdse.c
[3107/4194] Compiling source4/ntp_signd/ntp_signd.c
[3108/4194] Compiling source4/utils/oLschema2ldif/main.c
[3109/4194] Compiling source4/utils/oLschema2ldif/test.c
[3110/4194] Compiling source4/ntvfs/posix/python/pyxattr_native.c
[3111/4194] Linking bin/default/source4/cldap_server/libservice_module_cl=
dap.so
[3112/4194] Compiling source4/ntvfs/posix/python/pyposix_eadb.c
[3113/4194] Linking bin/default/source4/ntp_signd/libservice_module_ntp_s=
ignd.so
[3114/4194] Linking bin/default/source4/utils/oLschema2ldif/oLschema2ldif=

[3115/4194] Linking bin/default/source4/utils/oLschema2ldif/test_oLschema=
2ldif
[3116/4194] Linking bin/default/source4/ntvfs/posix/python-xattr-native.c=
python-36m-x86_64-linux-gnu.so
[3117/4194] Compiling source4/ntvfs/posix/python/pyxattr_tdb.c
[3118/4194] Linking bin/default/source4/ntvfs/posix/python-posix-eadb.cpy=
thon-36m-x86_64-linux-gnu.so
[3119/4194] Compiling source4/torture/util_smb.c
[3120/4194] Compiling source4/torture/basic/rename.c
[3121/4194] Compiling source4/torture/basic/charset.c
[3122/4194] Compiling source4/torture/basic/unlink.c
[3123/4194] Linking bin/default/source4/ntvfs/posix/python-xattr-tdb.cpyt=
hon-36m-x86_64-linux-gnu.so
[3124/4194] Compiling source4/torture/basic/dir.c
[3125/4194] Compiling source4/torture/basic/disconnect.c
[3126/4194] Compiling source4/torture/basic/scanner.c
[3127/4194] Compiling source4/torture/basic/secleak.c
[3128/4194] Compiling source4/torture/basic/locking.c
[3129/4194] Compiling source4/torture/basic/delete.c
[3130/4194] Compiling source4/torture/basic/misc.c
[3131/4194] Compiling source4/torture/basic/mangle_test.c
[3132/4194] Compiling source4/torture/basic/aliases.c
[3133/4194] Compiling source4/torture/basic/base.c
[3134/4194] Compiling source4/torture/basic/attr.c
[3135/4194] Compiling source4/torture/basic/delaywrite.c
[3136/4194] Compiling source4/torture/basic/properties.c
[3137/4194] Compiling source4/torture/basic/utable.c
[3138/4194] Compiling source4/torture/basic/denytest.c
[3139/4194] Compiling source4/torture/raw/acls.c
[3140/4194] Compiling source4/torture/raw/context.c
[3141/4194] Compiling source4/torture/raw/ioctl.c
[3142/4194] Compiling source4/torture/raw/mux.c
[3143/4194] Compiling source4/torture/raw/chkpath.c
[3144/4194] Compiling source4/torture/raw/read.c
[3145/4194] Compiling source4/torture/raw/qfsinfo.c
[3146/4194] Compiling source4/torture/raw/setfileinfo.c
[3147/4194] Compiling source4/torture/raw/openbench.c
[3148/4194] Compiling source4/torture/raw/qfileinfo.c
[3149/4194] Compiling source4/torture/raw/close.c
[3150/4194] Compiling source4/torture/raw/offline.c
[3151/4194] Compiling source4/torture/raw/samba3hide.c
[3152/4194] Compiling source4/torture/raw/search.c
[3153/4194] Compiling source4/torture/raw/raw.c
[3154/4194] Compiling source4/torture/raw/mkdir.c
[3155/4194] Compiling source4/torture/raw/streams.c
[3156/4194] Compiling source4/torture/raw/oplock.c
[3157/4194] Compiling source4/torture/raw/lock.c
[3158/4194] Compiling source4/torture/raw/write.c
[3159/4194] Compiling source4/torture/raw/session.c
[3160/4194] Compiling source4/torture/raw/open.c
[3161/4194] Compiling source4/torture/raw/unlink.c
[3162/4194] Compiling source4/torture/raw/eas.c
[3163/4194] Compiling source4/torture/raw/rename.c
[3164/4194] Compiling source4/torture/raw/lookuprate.c
[3165/4194] Compiling source4/torture/raw/seek.c
[3166/4194] Compiling source4/torture/raw/composite.c
[3167/4194] Compiling source4/torture/raw/samba3misc.c
[3168/4194] Compiling source4/torture/raw/tconrate.c
[3169/4194] Compiling source4/torture/raw/lockbench.c
[3170/4194] Compiling source4/torture/raw/notify.c
[3171/4194] Compiling source4/torture/raw/pingpong.c
[3172/4194] Compiling source4/torture/smb2/create.c
[3173/4194] Compiling source4/torture/smb2/notify.c
[3174/4194] Compiling source4/torture/smb2/oplock.c
[3175/4194] Compiling source4/torture/smb2/session.c
[3176/4194] Compiling source4/torture/smb2/read.c
[3177/4194] Compiling source4/torture/smb2/setinfo.c
[3178/4194] Compiling source4/torture/smb2/notify_disabled.c
[3179/4194] Compiling source4/torture/smb2/sharemode.c
[3180/4194] Compiling source4/torture/smb2/rename.c
[3181/4194] Compiling source4/torture/smb2/dosmode.c
[3182/4194] Compiling source4/torture/smb2/scan.c
[3183/4194] Compiling source4/torture/smb2/util.c
[3184/4194] Compiling source4/torture/smb2/replay.c
[3185/4194] Compiling source4/torture/smb2/multichannel.c
[3186/4194] Compiling source4/torture/smb2/maxfid.c
[3187/4194] Compiling source4/torture/smb2/lock.c
[3188/4194] Compiling source4/torture/smb2/lease_break_handler.c
[3189/4194] Compiling source4/torture/smb2/lease.c
[3190/4194] Compiling source4/torture/smb2/ioctl.c
[3191/4194] Compiling source4/torture/smb2/getinfo.c
[3192/4194] Compiling source4/torture/smb2/durable_v2_open.c
[3193/4194] Compiling source4/torture/smb2/durable_open.c
[3194/4194] Compiling source4/torture/smb2/delete-on-close.c
[3195/4194] Compiling source4/torture/smb2/credits.c
[3196/4194] Compiling source4/torture/smb2/maxwrite.c
[3197/4194] Compiling source4/torture/smb2/connect.c
[3198/4194] Compiling source4/torture/smb2/compound.c
[3199/4194] Compiling source4/torture/smb2/acls.c
[3200/4194] Compiling source4/torture/smb2/oplock_break_handler.c
[3201/4194] Compiling source4/torture/smb2/streams.c
[3202/4194] Compiling source4/torture/smb2/block.c
[3203/4194] Compiling source4/torture/smb2/dir.c
[3204/4194] Compiling source4/torture/smb2/smb2.c
[3205/4194] Compiling nsswitch/libwbclient/tests/wbclient.c
[3206/4194] Compiling source4/torture/winbind/winbind.c
[3207/4194] Compiling source4/torture/winbind/struct_based.c
[3208/4194] Compiling source4/torture/libnetapi/libnetapi_user.c
[3209/4194] Compiling source4/torture/libnetapi/libnetapi_server.c
[3210/4194] Compiling source4/torture/libnetapi/libnetapi_group.c
[3211/4194] Compiling source4/torture/libnetapi/libnetapi.c
[3212/4194] Compiling source4/torture/libsmbclient/libsmbclient.c
[3213/4194] Compiling source4/torture/gpo/apply.c
[3214/4194] Compiling source4/torture/gpo/gpo.c
[3215/4194] Compiling source4/torture/ndr/samr.c
[3216/4194] Compiling source4/torture/ndr/witness.c
[3217/4194] Compiling source4/torture/ndr/ntprinting.c
[3218/4194] Compiling source4/torture/ndr/nbt.c
[3219/4194] Compiling source4/torture/ndr/dnsp.c
[3220/4194] Compiling source4/torture/ndr/drsblobs.c
[3221/4194] Compiling source4/torture/ndr/atsvc.c
[3222/4194] Compiling source4/torture/ndr/krb5pac.c
[3223/4194] Compiling source4/torture/ndr/winspool.c
[3224/4194] Compiling source4/torture/ndr/string.c
[3225/4194] Compiling source4/torture/ndr/charset.c
[3226/4194] Compiling source4/torture/ndr/dfsblob.c
[3227/4194] Compiling source4/torture/ndr/netlogon.c
[3228/4194] Compiling source4/torture/ndr/drsuapi.c
[3229/4194] Compiling source4/torture/ndr/epmap.c
[3230/4194] Compiling source4/torture/ndr/backupkey.c
[3231/4194] Compiling source4/torture/ndr/negoex.c
[3232/4194] Compiling source4/torture/ndr/ntlmssp.c
[3233/4194] Compiling source4/torture/ndr/spoolss.c
[3234/4194] Compiling source4/torture/ndr/dfs.c
[3235/4194] Compiling source4/torture/ndr/lsa.c
[3236/4194] Compiling source4/torture/ndr/winreg.c
[3237/4194] Compiling source4/torture/ndr/cabinet.c
[3238/4194] Compiling source4/torture/ndr/clusapi.c
[3239/4194] Compiling source4/torture/ndr/ndr.c
[3240/4194] Compiling source4/torture/rpc/iremotewinspool_common.c
[3241/4194] Compiling source4/torture/rpc/samba3rpc.c
[3242/4194] Compiling source4/torture/rpc/testjoin.c
[3243/4194] Compiling source4/torture/rpc/autoidl.c
[3244/4194] Compiling source4/torture/rpc/scanner.c
[3245/4194] Compiling source4/torture/rpc/mgmt.c
[3246/4194] Compiling source4/torture/rpc/remact.c
[3247/4194] Compiling source4/torture/rpc/samlogon.c
[3248/4194] Compiling source4/torture/rpc/oxidresolve.c
[3249/4194] Compiling source4/torture/rpc/forest_trust.c
[3250/4194] Compiling source4/torture/rpc/iremotewinspool.c
[3251/4194] Compiling source4/torture/rpc/async_bind.c
[3252/4194] Compiling source4/torture/rpc/svcctl.c
[3253/4194] Compiling source4/torture/rpc/samr_accessmask.c
[3254/4194] Compiling source4/torture/rpc/unixinfo.c
[3255/4194] Compiling source4/torture/rpc/winreg.c
[3256/4194] Compiling source4/torture/rpc/spoolss_access.c
[3257/4194] Compiling source4/torture/rpc/schannel.c
[3258/4194] Compiling source4/torture/rpc/browser.c
[3259/4194] Compiling source4/torture/rpc/spoolss_win.c
[3260/4194] Compiling source4/torture/rpc/drsuapi_w2k8.c
[3261/4194] Compiling source4/torture/rpc/dfs.c
[3262/4194] Compiling source4/torture/rpc/handles.c
[3263/4194] Compiling source4/torture/rpc/bind.c
[3264/4194] Compiling source4/torture/rpc/remote_pac.c
[3265/4194] Compiling source4/torture/rpc/spoolss_notify.c
[3266/4194] Compiling source4/torture/rpc/eventlog.c
[3267/4194] Compiling source4/torture/rpc/clusapi.c
[3268/4194] Compiling source4/torture/rpc/witness.c
[3269/4194] Compiling source4/torture/rpc/backupkey.c
[3270/4194] Compiling source4/torture/rpc/alter_context.c
[3271/4194] Compiling source4/torture/rpc/echo.c
[3272/4194] Compiling source4/torture/rpc/lsa_lookup.c
[3273/4194] Compiling source4/torture/rpc/rpc.c
[3274/4194] Compiling source4/torture/rpc/iremotewinspool_driver.c
[3275/4194] Compiling source4/torture/rpc/frsapi.c
[3276/4194] Compiling source4/torture/rpc/object_uuid.c
[3277/4194] Compiling source4/torture/rpc/spoolss.c
[3278/4194] Compiling source4/torture/rpc/initshutdown.c
[3279/4194] Compiling source4/torture/rpc/epmapper.c
[3280/4194] Compiling source4/torture/rpc/atsvc.c
[3281/4194] Compiling source4/torture/rpc/wkssvc.c
[3282/4194] Compiling source4/torture/rpc/samr_priv.c
[3283/4194] Compiling source4/torture/rpc/samr.c
[3284/4194] Compiling source4/torture/rpc/dsgetinfo.c
[3285/4194] Compiling source4/torture/rpc/drsuapi.c
[3286/4194] Compiling source4/torture/rpc/session_key.c
[3287/4194] Compiling source4/torture/rpc/lsa.c
[3288/4194] Compiling source4/torture/rpc/join.c
[3289/4194] Compiling source4/torture/rpc/drsuapi_cracknames.c
[3290/4194] Compiling source4/torture/rpc/srvsvc.c
[3291/4194] Compiling source4/torture/rpc/samsync.c
[3292/4194] Compiling source4/torture/rpc/dssetup.c
[3293/4194] Compiling source4/torture/rpc/bench.c
[3294/4194] Compiling source4/torture/rpc/fsrvp.c
[3295/4194] Compiling source4/torture/rpc/ntsvcs.c
[3296/4194] Compiling source4/torture/rpc/netlogon.c
[3297/4194] Compiling source4/torture/rpc/countcalls.c
[3298/4194] Compiling source4/torture/drs/unit/schemainfo_tests.c
[3299/4194] Compiling source4/torture/drs/rpc/msds_intid.c
[3300/4194] Compiling source4/torture/drs/rpc/dssync.c
[3301/4194] Compiling source4/torture/drs/drs_util.c
[3302/4194] Compiling source4/torture/drs/unit/prefixmap_tests.c
[3303/4194] Compiling source4/torture/drs/drs_init.c
[3304/4194] Compiling source4/torture/dns/dlz_bind9.c
[3305/4194] Compiling source4/torture/dns/internal_dns.c
[3306/4194] Compiling source4/torture/rap/printing.c
[3307/4194] Compiling source4/torture/rap/sam.c
[3308/4194] Compiling source4/torture/rap/rap.c
[3309/4194] Compiling source4/torture/rap/rpc.c
[3310/4194] Compiling source4/torture/dfs/common.c
[3311/4194] Compiling source4/torture/dfs/domaindfs.c
[3312/4194] Compiling source4/torture/auth/pac.c
[3313/4194] Compiling source4/torture/auth/smbencrypt.c
[3314/4194] Compiling source4/torture/auth/ntlmssp.c
[3315/4194] Compiling source4/torture/ldb/ldb.c
[3316/4194] Compiling lib/util/charset/tests/convert_string.c
[3317/4194] Compiling lib/util/tests/strlist.c
[3318/4194] Compiling source4/libcli/security/tests/sddl.c
[3319/4194] Compiling lib/util/tests/str.c
[3320/4194] Compiling lib/util/tests/time.c
[3321/4194] Compiling source4/lib/messaging/tests/messaging.c
[3322/4194] Compiling lib/util/tests/data_blob.c
[3323/4194] Compiling lib/util/tests/binsearch.c
[3324/4194] Compiling lib/util/charset/tests/iconv.c
[3325/4194] Compiling lib/util/tests/idtree.c
[3326/4194] Compiling source4/libcli/resolve/testsuite.c
[3327/4194] Compiling lib/tevent/testsuite.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../lib/tevent/testsuite.c: In function =E2=80=98test_wrapper=E2=80=99=
:
=2E./../lib/tevent/testsuite.c:970:2: warning: =E2=80=98_tevent_context_w=
rapper_create=E2=80=99 is deprecated [-Wdeprecated-declarations]
  wrap_ev =3D tevent_context_wrapper_create(
  ^~~~~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2283:24: note: declared here
 struct tevent_context *_tevent_context_wrapper_create(struct tevent_cont=
ext *main_ev,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/tevent/testsuite.c:1014:2: warning: =E2=80=98_tevent_context_=
push_use=E2=80=99 is deprecated [-Wdeprecated-declarations]
  ret2 =3D tevent_context_push_use(wrap_ev);
  ^~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2362:6: note: declared here
 bool _tevent_context_push_use(struct tevent_context *ev,
      ^~~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/tevent/testsuite.c:1016:2: warning: =E2=80=98_tevent_context_=
push_use=E2=80=99 is deprecated [-Wdeprecated-declarations]
  ret2 =3D tevent_context_push_use(ev);
  ^~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2362:6: note: declared here
 bool _tevent_context_push_use(struct tevent_context *ev,
      ^~~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/tevent/testsuite.c:1018:2: warning: =E2=80=98_tevent_context_=
pop_use=E2=80=99 is deprecated [-Wdeprecated-declarations]
  tevent_context_pop_use(ev);
  ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2391:6: note: declared here
 void _tevent_context_pop_use(struct tevent_context *ev,
      ^~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/tevent/testsuite.c:1019:2: warning: =E2=80=98_tevent_context_=
pop_use=E2=80=99 is deprecated [-Wdeprecated-declarations]
  tevent_context_pop_use(wrap_ev);
  ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2391:6: note: declared here
 void _tevent_context_pop_use(struct tevent_context *ev,
      ^~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/tevent/testsuite.c:1048:2: warning: =E2=80=98_tevent_context_=
pop_use=E2=80=99 is deprecated [-Wdeprecated-declarations]
  tevent_context_pop_use(wrap_ev);
  ^~~~~~~~~~~~~~~~~~~~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2391:6: note: declared here
 void _tevent_context_pop_use(struct tevent_context *ev,
      ^~~~~~~~~~~~~~~~~~~~~~~
=2E./../lib/tevent/testsuite.c: In function =E2=80=98test_free_wrapper=E2=
=80=99:
=2E./../lib/tevent/testsuite.c:1144:2: warning: =E2=80=98_tevent_context_=
wrapper_create=E2=80=99 is deprecated [-Wdeprecated-declarations]
  wrap_ev =3D tevent_context_wrapper_create(
  ^~~~~~~
In file included from ../../lib/tevent/testsuite.c:29:0:
=2E./../lib/tevent/tevent.h:2283:24: note: declared here
 struct tevent_context *_tevent_context_wrapper_create(struct tevent_cont=
ext *main_ev,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[3328/4194] Compiling source4/torture/local/nss_tests.c
[3329/4194] Compiling source4/torture/local/verif_trailer.c
[3330/4194] Compiling lib/tevent/test_req.c
[3331/4194] Compiling lib/compression/testsuite.c
[3332/4194] Compiling lib/util/tests/util.c
[3333/4194] Compiling source4/param/tests/share.c
[3334/4194] Compiling source4/torture/local/fsrvp_state.c
[3335/4194] Compiling lib/util/tests/strv_util.c
[3336/4194] Compiling lib/util/tests/file.c
[3337/4194] Compiling lib/util/tests/dlinklist.c
[3338/4194] Compiling lib/util/charset/tests/charset.c
[3339/4194] Compiling lib/util/tests/asn1_tests.c
[3340/4194] Compiling lib/util/tests/util_str_escape.c
[3341/4194] Compiling source4/dsdb/schema/tests/schema_syntax.c
[3342/4194] Compiling source4/dsdb/common/tests/dsdb_dn.c
[3343/4194] Compiling source4/lib/messaging/tests/irpc.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../source4/lib/messaging/tests/irpc.c: In function =E2=80=98test_add=
one=E2=80=99:
=2E./../source4/lib/messaging/tests/irpc.c:109:2: warning: =E2=80=98dcerp=
c_binding_handle_set_sync_ev=E2=80=99 is deprecated [-Wdeprecated-declara=
tions]
  dcerpc_binding_handle_set_sync_ev(irpc_handle, data->ev);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/librpc/rpc/dcerpc.h:33:0,
                 from ./librpc/gen_ndr/ndr_echo_c.h:1,
                 from ../../source4/lib/messaging/tests/irpc.c:26:
=2E./../source4/../librpc/rpc/rpc_common.h:315:19: note: declared here
 _DEPRECATED_ void dcerpc_binding_handle_set_sync_ev(struct dcerpc_bindin=
g_handle *h,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=2E./../source4/lib/messaging/tests/irpc.c: In function =E2=80=98test_ech=
odata=E2=80=99:
=2E./../source4/lib/messaging/tests/irpc.c:148:2: warning: =E2=80=98dcerp=
c_binding_handle_set_sync_ev=E2=80=99 is deprecated [-Wdeprecated-declara=
tions]
  dcerpc_binding_handle_set_sync_ev(irpc_handle, data->ev);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../source4/librpc/rpc/dcerpc.h:33:0,
                 from ./librpc/gen_ndr/ndr_echo_c.h:1,
                 from ../../source4/lib/messaging/tests/irpc.c:26:
=2E./../source4/../librpc/rpc/rpc_common.h:315:19: note: declared here
 _DEPRECATED_ void dcerpc_binding_handle_set_sync_ev(struct dcerpc_bindin=
g_handle *h,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[3344/4194] Compiling source4/torture/local/torture.c
[3345/4194] Compiling source4/torture/local/dbspeed.c
[3346/4194] Compiling lib/tdr/testsuite.c
[3347/4194] Compiling lib/util/tests/genrand.c
[3348/4194] Compiling source4/lib/socket/testsuite.c
[3349/4194] Compiling source4/librpc/tests/binding_string.c
[3350/4194] Compiling lib/talloc/testsuite.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
=2E./../lib/talloc/testsuite.c: In function =E2=80=98test_memlimit=E2=80=99=
:
=2E./../lib/talloc/testsuite.c:1628:2: warning: =E2=80=98talloc_set_memli=
mit=E2=80=99 is deprecated [-Wdeprecated-declarations]
  torture_assert("memlimit", talloc_set_memlimit(l1, 2048) =3D=3D 0,
  ^~~~~~~~~~~~~~
In file included from ../../lib/talloc/testsuite.c:28:0:
=2E./../lib/talloc/talloc.h:1924:5: note: declared here
 int talloc_set_memlimit(const void *ctx, size_t max_size) _DEPRECATED_;
     ^~~~~~~~~~~~~~~~~~~
=2E./../lib/talloc/testsuite.c:1688:2: warning: =E2=80=98talloc_set_memli=
mit=E2=80=99 is deprecated [-Wdeprecated-declarations]
  torture_assert("memlimit", talloc_set_memlimit(l3, 1024) =3D=3D 0,
  ^~~~~~~~~~~~~~
In file included from ../../lib/talloc/testsuite.c:28:0:
=2E./../lib/talloc/talloc.h:1924:5: note: declared here
 int talloc_set_memlimit(const void *ctx, size_t max_size) _DEPRECATED_;
     ^~~~~~~~~~~~~~~~~~~
=2E./../lib/talloc/testsuite.c:1701:2: warning: =E2=80=98talloc_set_memli=
mit=E2=80=99 is deprecated [-Wdeprecated-declarations]
  torture_assert("memlimit", talloc_set_memlimit(l4, 512) =3D=3D 0,
  ^~~~~~~~~~~~~~
In file included from ../../lib/talloc/testsuite.c:28:0:
=2E./../lib/talloc/talloc.h:1924:5: note: declared here
 int talloc_set_memlimit(const void *ctx, size_t max_size) _DEPRECATED_;
     ^~~~~~~~~~~~~~~~~~~
=2E./../lib/talloc/testsuite.c:1735:2: warning: =E2=80=98talloc_set_memli=
mit=E2=80=99 is deprecated [-Wdeprecated-declarations]
  torture_assert("memlimit", talloc_set_memlimit(l4, 512) =3D=3D 0,
  ^~~~~~~~~~~~~~
In file included from ../../lib/talloc/testsuite.c:28:0:
=2E./../lib/talloc/talloc.h:1924:5: note: declared here
 int talloc_set_memlimit(const void *ctx, size_t max_size) _DEPRECATED_;
     ^~~~~~~~~~~~~~~~~~~
=2E./../lib/talloc/testsuite.c:1765:2: warning: =E2=80=98talloc_set_memli=
mit=E2=80=99 is deprecated [-Wdeprecated-declarations]
  talloc_set_memlimit(pool, 10*1024);
  ^~~~~~~~~~~~~~~~~~~
In file included from ../../lib/talloc/testsuite.c:28:0:
=2E./../lib/talloc/talloc.h:1924:5: note: declared here
 int talloc_set_memlimit(const void *ctx, size_t max_size) _DEPRECATED_;
     ^~~~~~~~~~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[3351/4194] Compiling lib/util/tests/tfork.c
[3352/4194] Compiling auth/credentials/tests/simple.c
[3353/4194] Compiling lib/util/tests/anonymous_shared.c
[3354/4194] Compiling source4/torture/local/local.c
[3355/4194] Compiling source4/param/tests/loadparm.c
[3356/4194] Compiling lib/util/tests/strv.c
[3357/4194] Compiling source4/torture/krb5/kdc-canon-heimdal.c
[3358/4194] Compiling source4/torture/krb5/kdc-heimdal.c
[3359/4194] Compiling source4/torture/nbench/nbio.c
[3360/4194] Compiling source4/torture/nbench/nbench.c
[3361/4194] Compiling source4/torture/unix/whoami.c
[3362/4194] Compiling source4/torture/unix/unix_info2.c
[3363/4194] Compiling source4/torture/unix/unix.c
[3364/4194] Compiling source4/torture/ldap/schema.c
[3365/4194] Compiling source4/torture/ldap/nested_search.c
[3366/4194] Compiling source4/torture/ldap/basic.c
[3367/4194] Compiling source4/torture/ldap/ldap_sort.c
[3368/4194] Compiling source4/torture/ldap/common.c
[3369/4194] Compiling source4/torture/ldap/cldapbench.c
[3370/4194] Compiling source4/torture/ldap/cldap.c
[3371/4194] Compiling source4/torture/ldap/uptodatevector.c
[3372/4194] Compiling source4/torture/ldap/netlogon.c
[3373/4194] Compiling source4/torture/nbt/dgram.c
[3374/4194] Compiling source4/torture/nbt/winsbench.c
[3375/4194] Compiling source4/torture/nbt/wins.c
[3376/4194] Compiling source4/torture/nbt/nbt.c
[3377/4194] Compiling source4/torture/nbt/query.c
[3378/4194] Compiling source4/torture/nbt/winsreplication.c
[3379/4194] Compiling source4/torture/nbt/register.c
[3380/4194] Compiling source4/torture/libnet/libnet_BecomeDC.c
[3381/4194] Compiling source4/torture/libnet/libnet_rpc.c
[3382/4194] Compiling source4/torture/libnet/groupinfo.c
[3383/4194] Compiling source4/torture/libnet/libnet.c
[3384/4194] Compiling source4/torture/libnet/libnet_domain.c
[3385/4194] Compiling source4/torture/libnet/libnet_group.c
[3386/4194] Compiling source4/torture/libnet/utils.c
[3387/4194] Compiling source4/torture/libnet/libnet_user.c
[3388/4194] Compiling source4/torture/libnet/domain.c
[3389/4194] Compiling source4/torture/libnet/groupman.c
[3390/4194] Compiling source4/torture/libnet/userman.c
[3391/4194] Compiling source4/torture/libnet/userinfo.c
[3392/4194] Compiling source4/torture/libnet/libnet_lookup.c
[3393/4194] Compiling source4/torture/libnet/libnet_share.c
[3394/4194] Compiling source4/torture/ntp/ntp_signd.c
[3395/4194] Compiling source4/torture/vfs/acl_xattr.c
[3396/4194] Compiling source4/torture/vfs/fruit.c
[3397/4194] Compiling source4/torture/vfs/vfs.c
[3398/4194] Compiling source4/torture/shell.c
[3399/4194] Compiling source4/torture/torture.c
[3400/4194] Compiling source4/torture/smbtorture.c
[3401/4194] Compiling bin/default/source4/torture/smbtorture.objlist.empt=
y.c
[3402/4194] Compiling source4/torture/gentest.c
[3403/4194] Compiling source4/torture/masktest.c
[3404/4194] Compiling source4/torture/locktest.c
[3405/4194] Compiling source4/dsdb/common/tests/dsdb.c
[3406/4194] Compiling bin/default/librpc/gen_ndr/ndr_rap.c
[3407/4194] Compiling librpc/ndr/ndr_rap.c
[3408/4194] Linking bin/default/source4/torture/gentest
[3409/4194] Linking bin/default/source4/torture/masktest
[3410/4194] Linking bin/default/source4/torture/locktest
[3411/4194] Compiling bin/default/librpc/gen_ndr/ndr_rot_c.c
[3412/4194] Compiling bin/default/librpc/gen_ndr/ndr_frsapi_c.c
[3413/4194] Compiling bin/default/librpc/gen_ndr/ndr_browser_c.c
[3414/4194] Compiling bin/default/librpc/gen_ndr/ndr_oxidresolver_c.c
[3415/4194] Compiling bin/default/librpc/gen_ndr/ndr_remact_c.c
[3416/4194] Compiling bin/default/librpc/gen_ndr/srv_winbind.c
[3417/4194] Compiling source4/client/client.c
[3418/4194] Compiling source4/client/cifsddio.c
[3419/4194] Compiling source4/client/cifsdd.c
[3420/4194] Compiling source4/libcli/rap/rap.c
[3421/4194] Compiling libcli/smb/test_smb1cli_session.c
[3422/4194] Compiling bin/default/libcli/util/py_ntstatus.c
[3423/4194] Linking bin/default/source4/client/smbclient4
[3424/4194] Linking bin/default/source4/client/cifsdd
[3425/4194] Compiling bin/default/libcli/util/py_werror.c
[3426/4194] Compiling lib/async_req/async_connect_send_test.c
[3427/4194] Linking bin/default/libcli/smb/test_smb1cli_session
[3428/4194] Linking bin/default/libcli/util/python-ntstatus.cpython-36m-x=
86_64-linux-gnu.so
[3429/4194] Compiling libcli/security/pysecurity.c
[3430/4194] Compiling libcli/nbt/tools/nmblookup.c
[3431/4194] Linking bin/default/libcli/util/python-werror.cpython-36m-x86=
_64-linux-gnu.so
[3432/4194] Linking bin/default/lib/async_req/async_connect_send_test
[3433/4194] Compiling libcli/nbt/pynbt.c
[3434/4194] Compiling libcli/auth/tests/ntlm_check.c
[3435/4194] Linking bin/default/libcli/security/pysecurity.cpython-36m-x8=
6_64-linux-gnu.so
[3436/4194] Linking bin/default/libcli/nbt/nmblookup4
[3437/4194] Compiling libcli/echo/echo.c
[3438/4194] Compiling libcli/echo/tests/echo.c
[3439/4194] Linking bin/default/libcli/nbt/python-netbios.cpython-36m-x86=
_64-linux-gnu.so
[3440/4194] Linking bin/default/libcli/auth/test_ntlm_check
[3441/4194] Compiling libcli/dns/resolvconftest.c
[3442/4194] Compiling libcli/dns/dns_lookuptest.c
[3443/4194] Linking bin/default/source4/torture/smbtorture
[3444/4194] Compiling lib/mscat/dumpmscat.c
[3445/4194] Compiling source4/lib/policy/pypolicy.c
[3446/4194] Compiling testsuite/unittests/test_krb5_samba.c
[3447/4194] Linking bin/default/libcli/dns/resolvconftest
[3448/4194] Linking bin/default/libcli/dns/dns_lookuptest
[3449/4194] Compiling testsuite/unittests/test_sambafs_srv_pipe.c
[3450/4194] Linking bin/default/lib/mscat/dumpmscat
[3451/4194] Linking bin/default/source4/lib/policy/py-policy.cpython-36m-=
x86_64-linux-gnu.so
[3452/4194] Linking bin/default/testsuite/unittests/test_krb5samba
[3453/4194] Compiling testsuite/unittests/test_lib_util_modules.c
[3454/4194] Compiling testsuite/unittests/rpc_test_dummy_module.c
[3455/4194] Linking bin/default/testsuite/unittests/test_sambafs_srv_pipe=

[3456/4194] Compiling source4/heimdal/kuser/kinit.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
In file included from ../../source4/heimdal/kuser/kuser_locl.h:83:0,
                 from ../../source4/heimdal/kuser/kinit.c:36:
=2E./../source4/heimdal_build/kafs.h:1:5: warning: no previous prototype =
for =E2=80=98k_hasafs=E2=80=99 [-Wmissing-prototypes]
 int k_hasafs (void) {
     ^~~~~~~~
=2E./../source4/heimdal_build/kafs.h:5:5: warning: no previous prototype =
for =E2=80=98krb_afslog=E2=80=99 [-Wmissing-prototypes]
 int krb_afslog (const char *cell, const char *realm) {
     ^~~~~~~~~~
=2E./../source4/heimdal_build/kafs.h:8:5: warning: no previous prototype =
for =E2=80=98k_unlog=E2=80=99 [-Wmissing-prototypes]
 int k_unlog (void) {
     ^~~~~~~
=2E./../source4/heimdal_build/kafs.h:11:5: warning: no previous prototype=
 for =E2=80=98k_setpag=E2=80=99 [-Wmissing-prototypes]
 int k_setpag (void) {
     ^~~~~~~~
=2E./../source4/heimdal_build/kafs.h:14:17: warning: no previous prototyp=
e for =E2=80=98krb5_afslog=E2=80=99 [-Wmissing-prototypes]
 krb5_error_code krb5_afslog (krb5_context context,
                 ^~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[3457/4194] Compiling source4/heimdal/kuser/kgetcred.c

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
In file included from ../../source4/heimdal/kuser/kuser_locl.h:83:0,
                 from ../../source4/heimdal/kuser/kgetcred.c:34:
=2E./../source4/heimdal_build/kafs.h:1:5: warning: no previous prototype =
for =E2=80=98k_hasafs=E2=80=99 [-Wmissing-prototypes]
 int k_hasafs (void) {
     ^~~~~~~~
=2E./../source4/heimdal_build/kafs.h:5:5: warning: no previous prototype =
for =E2=80=98krb_afslog=E2=80=99 [-Wmissing-prototypes]
 int krb_afslog (const char *cell, const char *realm) {
     ^~~~~~~~~~
=2E./../source4/heimdal_build/kafs.h:8:5: warning: no previous prototype =
for =E2=80=98k_unlog=E2=80=99 [-Wmissing-prototypes]
 int k_unlog (void) {
     ^~~~~~~
=2E./../source4/heimdal_build/kafs.h:11:5: warning: no previous prototype=
 for =E2=80=98k_setpag=E2=80=99 [-Wmissing-prototypes]
 int k_setpag (void) {
     ^~~~~~~~
=2E./../source4/heimdal_build/kafs.h:14:17: warning: no previous prototyp=
e for =E2=80=98krb5_afslog=E2=80=99 [-Wmissing-prototypes]
 krb5_error_code krb5_afslog (krb5_context context,
                 ^~~~~~~~~~~


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[3458/4194] Compiling source4/heimdal/kpasswd/kpasswd.c
[3459/4194] Linking bin/default/testsuite/unittests/test_lib_util_modules=

[3460/4194] Linking bin/default/testsuite/unittests/librpc_module_test_du=
mmy_module.so
[3461/4194] Compiling source4/kdc/kdc-heimdal.c
[3462/4194] Linking bin/default/source4/heimdal_build/samba4kinit
[3463/4194] Linking bin/default/source4/heimdal_build/samba4kgetcred
[3464/4194] Linking bin/default/source4/heimdal_build/samba4kpasswd
[3465/4194] Compiling source4/kdc/kdc-proxy.c
[3466/4194] Compiling source4/kdc/kdc-server.c
[3467/4194] Compiling source4/kdc/kpasswd-service.c
[3468/4194] Compiling source4/kdc/kpasswd-helper.c
[3469/4194] Compiling source4/kdc/kpasswd-service-heimdal.c
[3470/4194] Compiling source4/kdc/kdc-glue.c
[3471/4194] Compiling source4/kdc/wdc-samba4.c
[3472/4194] Compiling source4/kdc/kpasswd_glue.c
[3473/4194] Linking bin/default/source4/kdc/libservice_module_kdc.so
[3474/4194] Compiling source4/kdc/ktutil.c
[3475/4194] Compiling lib/pthreadpool/tests.c
[3476/4194] Compiling lib/pthreadpool/tests_cmocka.c
[3477/4194] Compiling source3/lib/test_tldap.c
[3478/4194] Compiling source3/registry/tests/test_regfio.c
[3479/4194] Compiling source3/libnet/libnet_dssync_keytab.c
[3480/4194] Linking bin/default/source4/kdc/samba4ktutil
[3481/4194] Linking bin/default/lib/pthreadpool/pthreadpooltest
[3482/4194] Linking bin/default/lib/pthreadpool/pthreadpooltest_cmocka
[3483/4194] Linking bin/default/source3/test_tldap
[3484/4194] Linking bin/default/source3/test_registry_regfio
[3485/4194] Compiling source3/libnet/libnet_dssync_passdb.c
[3486/4194] Compiling source3/libnet/libnet_dssync.c
[3487/4194] Compiling source3/libsmb/passchange.c
[3488/4194] Compiling source3/lib/tevent_glib_glue.c
[3489/4194] Compiling source3/smbd/server.c
[3490/4194] Compiling source3/smbd/smbd_cleanupd.c
[3491/4194] Compiling source3/lib/tdb_validate.c
[3492/4194] Compiling source3/client/clitar.c
[3493/4194] Compiling source3/client/dnsbrowse.c
[3494/4194] Compiling source3/client/client.c
[3495/4194] Compiling source3/client/smbspool.c
[3496/4194] Compiling source3/client/smbspool_krb5_wrapper.c
[3497/4194] Compiling source3/torture/locktest2.c
[3498/4194] Linking bin/default/source3/client/smbclient
[3499/4194] Compiling source3/torture/test_messaging_read.c
[3500/4194] Compiling source3/torture/test_oplock_cancel.c
[3501/4194] Linking bin/default/source3/smbspool
[3502/4194] Linking bin/default/source3/smbspool_krb5_wrapper
[3503/4194] Linking bin/default/source3/locktest2
[3504/4194] Compiling source3/torture/test_dbwrap_do_locked.c
[3505/4194] Compiling source3/torture/nbio.c
[3506/4194] Compiling source3/torture/scanner.c
[3507/4194] Compiling source3/torture/test_nttrans_create.c
[3508/4194] Compiling source3/torture/test_g_lock.c
[3509/4194] Compiling source3/torture/test_smbsock_any_connect.c
[3510/4194] Compiling source3/lib/tevent_barrier.c
[3511/4194] Compiling source3/torture/test_notify.c
[3512/4194] Compiling source3/torture/test_idmap_tdb_common.c
[3513/4194] Compiling source3/torture/mangle_test.c
[3514/4194] Compiling source3/torture/test_async_echo.c
[3515/4194] Compiling source3/torture/test_nttrans_fsctl.c
[3516/4194] Compiling source3/torture/test_hidenewfiles.c
[3517/4194] Compiling source3/torture/nbench.c
[3518/4194] Compiling source3/torture/test_smb2.c
[3519/4194] Compiling source3/torture/utable.c
[3520/4194] Compiling source3/torture/test_idmap_cache.c
[3521/4194] Compiling source3/torture/test_authinfo_structs.c
[3522/4194] Compiling source3/torture/torture.c
[3523/4194] Compiling source3/torture/test_buffersize.c
[3524/4194] Compiling source3/torture/test_posix_append.c
[3525/4194] Compiling source3/torture/test_notify_online.c
[3526/4194] Compiling source3/torture/bench_pthreadpool.c
[3527/4194] Compiling source3/torture/test_messaging_fd_passing.c
[3528/4194] Compiling source3/torture/test_namemap_cache.c
[3529/4194] Compiling source3/torture/test_chain3.c
[3530/4194] Compiling source3/torture/wbc_async.c
[3531/4194] Compiling source3/torture/test_messaging_send_all.c
[3532/4194] Compiling source3/torture/denytest.c
[3533/4194] Compiling source3/torture/test_dbwrap_ctdb.c
[3534/4194] Compiling source3/torture/test_cleanup.c
[3535/4194] Compiling source3/torture/test_pthreadpool_tevent.c
[3536/4194] Compiling source3/torture/test_case_insensitive.c
[3537/4194] Compiling source3/torture/test_dbwrap_watch.c
[3538/4194] Compiling source3/torture/test_addrchange.c
[3539/4194] Linking bin/default/source3/smbtorture3
[3540/4194] Compiling source3/lib/smbconf/testsuite.c
[3541/4194] Compiling source3/torture/msgtest.c
[3542/4194] Compiling source3/torture/msg_sink.c
[3543/4194] Compiling source3/torture/msg_source.c
[3544/4194] Compiling source3/torture/pdbtest.c
[3545/4194] Compiling source3/torture/vfstest_chain.c
[3546/4194] Linking bin/default/source3/smbconftort
[3547/4194] Linking bin/default/source3/msgtest
[3548/4194] Linking bin/default/source3/msg_sink
[3549/4194] Linking bin/default/source3/msg_source
[3550/4194] Linking bin/default/source3/pdbtest
[3551/4194] Compiling source3/torture/vfstest.c
[3552/4194] Compiling source3/torture/cmd_vfs.c
[3553/4194] Compiling source3/lib/version_test.c
[3554/4194] Compiling source3/script/tests/timelimit.c
[3555/4194] Compiling source3/torture/rpc_open_tcp.c
[3556/4194] Compiling source3/printing/tests/vlp.c
[3557/4194] Linking bin/default/source3/vfstest
[3558/4194] Compiling source3/smbd/pysmbd.c
[3559/4194] Linking bin/default/source3/versiontest
[3560/4194] Linking bin/default/source3/timelimit
[3561/4194] Linking bin/default/source3/rpc_open_tcp
[3562/4194] Linking bin/default/source3/vlp
[3563/4194] Compiling source3/libsmb/pylibsmb.c
[3564/4194] Linking bin/default/source3/pysmbd.cpython-36m-x86_64-linux-g=
nu.so
[3565/4194] Compiling source3/lib/tevent_glib_glue_tests.c
[3566/4194] Compiling source3/auth/auth_script.c
[3567/4194] Compiling source3/libgpo/gpext/registry.c
[3568/4194] Compiling source3/libgpo/gpext/scripts.c
[3569/4194] Linking bin/default/source3/pylibsmb.cpython-36m-x86_64-linux=
-gnu.so
[3570/4194] Compiling source3/libgpo/gpext/security.c
[3571/4194] Linking bin/default/source3/tevent_glib_glue_test
[3572/4194] Linking bin/default/source3/auth/libauth_module_script.so
[3573/4194] Linking bin/default/source3/libgpo/gpext/libgpext_module_regi=
stry.so
[3574/4194] Linking bin/default/source3/libgpo/gpext/libgpext_module_scri=
pts.so
[3575/4194] Compiling source3/modules/non_posix_acls.c
[3576/4194] Linking bin/default/source3/libgpo/gpext/libgpext_module_secu=
rity.so
[3577/4194] Compiling source3/modules/vfs_virusfilter_utils.c
[3578/4194] Compiling source3/modules/vfs_audit.c
[3579/4194] Compiling source3/modules/vfs_extd_audit.c
[3580/4194] Compiling source3/modules/vfs_full_audit.c
[3581/4194] Compiling source3/modules/vfs_fake_perms.c
[3582/4194] Compiling source3/modules/vfs_fake_acls.c
[3583/4194] Compiling source3/modules/vfs_recycle.c
[3584/4194] Linking bin/default/source3/modules/libvfs_module_audit.so
[3585/4194] Linking bin/default/source3/modules/libvfs_module_extd_audit.=
so
[3586/4194] Linking bin/default/source3/modules/libvfs_module_full_audit.=
so
[3587/4194] Linking bin/default/source3/modules/libvfs_module_fake_perms.=
so
[3588/4194] Linking bin/default/source3/modules/libvfs_module_fake_acls.s=
o
[3589/4194] Linking bin/default/source3/modules/libvfs_module_recycle.so
[3590/4194] Compiling source3/modules/vfs_netatalk.c
[3591/4194] Compiling source3/modules/vfs_fruit.c
[3592/4194] Compiling source3/modules/vfs_default_quota.c
[3593/4194] Compiling source3/modules/vfs_readonly.c
[3594/4194] Compiling source3/modules/getdate.c
[3595/4194] Compiling source3/modules/vfs_cap.c
[3596/4194] Linking bin/default/source3/modules/libvfs_module_netatalk.so=

[3597/4194] Linking bin/default/source3/modules/libvfs_module_fruit.so
[3598/4194] Linking bin/default/source3/modules/libvfs_module_default_quo=
ta.so
[3599/4194] Linking bin/default/source3/modules/libvfs_module_readonly.so=

[3600/4194] Compiling source3/modules/vfs_expand_msdfs.c
[3601/4194] Linking bin/default/source3/modules/libvfs_module_cap.so
[3602/4194] Compiling source3/modules/vfs_shadow_copy.c
[3603/4194] Compiling source3/modules/vfs_shadow_copy2.c
[3604/4194] Compiling source3/modules/vfs_xattr_tdb.c
[3605/4194] Compiling source3/modules/vfs_posix_eadb.c
[3606/4194] Linking bin/default/source3/modules/libvfs_module_expand_msdf=
s.so
[3607/4194] Compiling bin/default/source3/modules/nfs41acl_xdr.c
[3608/4194] Linking bin/default/source3/modules/libvfs_module_shadow_copy=
=2Eso
[3609/4194] Linking bin/default/source3/modules/libvfs_module_shadow_copy=
2.so
[3610/4194] Linking bin/default/source3/modules/libvfs_module_xattr_tdb.s=
o
[3611/4194] Linking bin/default/source3/modules/libvfs_module_posix_eadb.=
so
[3612/4194] Compiling source3/modules/nfs4acl_xattr_util.c
[3613/4194] Compiling source3/modules/nfs4acl_xattr_nfs.c
[3614/4194] Compiling source3/modules/vfs_nfs4acl_xattr.c
[3615/4194] Compiling source3/modules/nfs4acl_xattr_xdr.c
[3616/4194] Compiling source3/modules/nfs4acl_xattr_ndr.c
[3617/4194] Compiling source3/modules/vfs_catia.c
[3618/4194] Linking bin/default/source3/modules/libvfs_module_nfs4acl_xat=
tr.so
[3619/4194] Compiling source3/modules/vfs_streams_xattr.c
[3620/4194] Compiling source3/modules/vfs_streams_depot.c
[3621/4194] Compiling source3/modules/vfs_commit.c
[3622/4194] Compiling source3/modules/vfs_gpfs.c
[3623/4194] Linking bin/default/source3/modules/libvfs_module_catia.so
[3624/4194] Compiling source3/modules/vfs_readahead.c
[3625/4194] Linking bin/default/source3/modules/libvfs_module_streams_xat=
tr.so
[3626/4194] Linking bin/default/source3/modules/libvfs_module_streams_dep=
ot.so
[3627/4194] Linking bin/default/source3/modules/libvfs_module_commit.so
[3628/4194] Linking bin/default/source3/modules/libvfs_module_gpfs.so
[3629/4194] Compiling source3/modules/vfs_fileid.c
[3630/4194] Linking bin/default/source3/modules/libvfs_module_readahead.s=
o
[3631/4194] Compiling source3/modules/vfs_aio_fork.c
[3632/4194] Compiling source3/modules/vfs_aio_pthread.c
[3633/4194] Compiling source3/modules/vfs_preopen.c
[3634/4194] Compiling source3/modules/vfs_syncops.c
[3635/4194] Linking bin/default/source3/modules/libvfs_module_fileid.so
[3636/4194] Compiling source3/modules/vfs_acl_xattr.c
[3637/4194] Linking bin/default/source3/modules/libvfs_module_aio_fork.so=

[3638/4194] Linking bin/default/source3/modules/libvfs_module_aio_pthread=
=2Eso
[3639/4194] Linking bin/default/source3/modules/libvfs_module_preopen.so
[3640/4194] Linking bin/default/source3/modules/libvfs_module_syncops.so
[3641/4194] Compiling source3/modules/vfs_acl_tdb.c
[3642/4194] Linking bin/default/source3/modules/libvfs_module_acl_xattr.s=
o
[3643/4194] Compiling source3/modules/vfs_dirsort.c
[3644/4194] Compiling source3/modules/vfs_crossrename.c
[3645/4194] Compiling source3/modules/vfs_linux_xfs_sgid.c
[3646/4194] Compiling source3/modules/vfs_time_audit.c
[3647/4194] Linking bin/default/source3/modules/libvfs_module_acl_tdb.so
[3648/4194] Compiling source3/modules/vfs_media_harmony.c
[3649/4194] Linking bin/default/source3/modules/libvfs_module_dirsort.so
[3650/4194] Linking bin/default/source3/modules/libvfs_module_crossrename=
=2Eso
[3651/4194] Linking bin/default/source3/modules/libvfs_module_linux_xfs_s=
gid.so
[3652/4194] Linking bin/default/source3/modules/libvfs_module_time_audit.=
so
[3653/4194] Compiling source3/modules/vfs_unityed_media.c
[3654/4194] Linking bin/default/source3/modules/libvfs_module_media_harmo=
ny.so
[3655/4194] Compiling source3/modules/vfs_btrfs.c
[3656/4194] Compiling source3/modules/vfs_shell_snap.c
[3657/4194] Compiling bin/default/source3/modules/perfcount.empty.c
[3658/4194] Compiling source3/modules/perfcount_test.c
[3659/4194] Linking bin/default/source3/modules/libvfs_module_unityed_med=
ia.so
[3660/4194] Compiling source3/modules/vfs_ceph.c
[3661/4194] Linking bin/default/source3/modules/libvfs_module_btrfs.so
[3662/4194] Linking bin/default/source3/modules/libvfs_module_shell_snap.=
so
[3663/4194] Linking bin/default/source3/modules/libperfcount_module_test.=
so
[3664/4194] Compiling source3/modules/vfs_ceph_snapshots.c
[3665/4194] Compiling source3/modules/vfs_glusterfs.c
[3666/4194] Linking bin/default/source3/modules/libvfs_module_ceph.so
[3667/4194] Compiling source3/modules/vfs_glusterfs_fuse.c
[3668/4194] Compiling source3/modules/vfs_worm.c
[3669/4194] Compiling source3/modules/vfs_snapper.c
[3670/4194] Linking bin/default/source3/modules/libvfs_module_ceph_snapsh=
ots.so
[3671/4194] Linking bin/default/source3/modules/libvfs_module_glusterfs.s=
o
[3672/4194] Compiling source3/modules/vfs_virusfilter_fsav.c
[3673/4194] Linking bin/default/source3/modules/libvfs_module_glusterfs_f=
use.so
[3674/4194] Linking bin/default/source3/modules/libvfs_module_worm.so
[3675/4194] Linking bin/default/source3/modules/libvfs_module_snapper.so
[3676/4194] Compiling source3/modules/vfs_virusfilter.c
[3677/4194] Compiling source3/modules/vfs_virusfilter_sophos.c
[3678/4194] Compiling source3/modules/vfs_virusfilter_clamav.c
[3679/4194] Compiling source3/modules/vfs_offline.c
[3680/4194] Compiling source3/modules/vfs_fake_dfq.c
[3681/4194] Compiling source3/modules/vfs_error_inject.c
[3682/4194] Linking bin/default/source3/modules/libvfs_module_virusfilter=
=2Eso
[3683/4194] Compiling source3/modules/vfs_delay_inject.c
[3684/4194] Compiling source3/param/pyparam.c
[3685/4194] Linking bin/default/source3/modules/libvfs_module_offline.so
[3686/4194] Linking bin/default/source3/modules/libvfs_module_fake_dfq.so=

[3687/4194] Linking bin/default/source3/modules/libvfs_module_error_injec=
t.so
[3688/4194] Compiling source3/param/test_lp_load.c
[3689/4194] Linking bin/default/source3/modules/libvfs_module_delay_injec=
t.so
[3690/4194] Linking bin/default/source3/param/pys3param.cpython-36m-x86_6=
4-linux-gnu.so
[3691/4194] Compiling source3/passdb/py_passdb.c
[3692/4194] Compiling source3/rpc_server/epmd.c
[3693/4194] Compiling source3/rpc_server/lsasd.c
[3694/4194] Linking bin/default/source3/param/test_lp_load
[3695/4194] Compiling source3/rpc_server/fssd.c
[3696/4194] Compiling bin/default/source3/winbindd/idmap_ad.empty.c
[3697/4194] Linking bin/default/source3/passdb/pypassdb.cpython-36m-x86_6=
4-linux-gnu.so
[3698/4194] Linking bin/default/source3/smbd/smbd
[3699/4194] Compiling source3/winbindd/idmap_rfc2307.c
[3700/4194] Compiling source3/winbindd/idmap_rid.c
[3701/4194] Compiling source3/winbindd/idmap_tdb2.c
[3702/4194] Linking bin/default/source3/winbindd/libidmap_module_ad.so
[3703/4194] Compiling bin/default/source3/winbindd/idmap_hash.empty.c
[3704/4194] Compiling source3/winbindd/idmap_autorid.c
[3705/4194] Linking bin/default/source3/winbindd/libidmap_module_rfc2307.=
so
[3706/4194] Linking bin/default/source3/winbindd/libidmap_module_rid.so
[3707/4194] Linking bin/default/source3/winbindd/libidmap_module_tdb2.so
[3708/4194] Compiling bin/default/source3/winbindd/nss_info_hash.empty.c
[3709/4194] Linking bin/default/source3/winbindd/libidmap_module_hash.so
[3710/4194] Linking bin/default/source3/winbindd/libidmap_module_autorid.=
so
[3711/4194] Compiling bin/default/source3/winbindd/nss_info_rfc2307.empty=
=2Ec
[3712/4194] Compiling bin/default/source3/winbindd/nss_info_sfu20.empty.c=

[3713/4194] Compiling bin/default/source3/winbindd/nss_info_sfu.empty.c
[3714/4194] Linking bin/default/source3/winbindd/libnss_info_module_hash.=
so
[3715/4194] Compiling source3/winbindd/idmap_script.c
[3716/4194] Compiling source3/winbindd/winbindd_cache.c
[3717/4194] Linking bin/default/source3/winbindd/libnss_info_module_rfc23=
07.so
[3718/4194] Linking bin/default/source3/winbindd/libnss_info_module_sfu20=
=2Eso
[3719/4194] Linking bin/default/source3/winbindd/libnss_info_module_sfu.s=
o
[3720/4194] Compiling source3/winbindd/winbindd_pam_logoff.c
[3721/4194] Linking bin/default/source3/winbindd/libidmap_module_script.s=
o
[3722/4194] Compiling source3/winbindd/winbindd_getgroups.c
[3723/4194] Compiling source3/winbindd/winbindd_dsgetdcname.c
[3724/4194] Compiling source3/winbindd/wb_lookupsid.c
[3725/4194] Compiling source3/winbindd/winbindd_pam_auth.c
[3726/4194] Compiling source3/winbindd/winbindd_getgrent.c
[3727/4194] Compiling source3/winbindd/wb_lookupuseraliases.c
[3728/4194] Compiling source3/winbindd/winbindd_getsidaliases.c
[3729/4194] Compiling source3/winbindd/wb_xids2sids.c
[3730/4194] Compiling source3/winbindd/wb_query_user_list.c
[3731/4194] Compiling source3/winbindd/wb_queryuser.c
[3732/4194] Compiling source3/winbindd/wb_getgrsid.c
[3733/4194] Compiling source3/winbindd/winbindd_reconnect.c
[3734/4194] Compiling source3/winbindd/winbindd_lookupsids.c
[3735/4194] Compiling source3/winbindd/winbindd_setgrent.c
[3736/4194] Compiling source3/winbindd/winbindd_dual_srv.c
[3737/4194] Compiling source3/winbindd/winbindd_endgrent.c
[3738/4194] Compiling source3/winbindd/winbindd.c
[3739/4194] Compiling source3/winbindd/winbindd_lookuprids.c
[3740/4194] Compiling source3/winbindd/wb_lookupname.c
[3741/4194] Compiling source3/winbindd/winbindd_domain.c
[3742/4194] Compiling source3/winbindd/winbindd_gpupdate.c
[3743/4194] Compiling source3/winbindd/wb_next_pwent.c
[3744/4194] Compiling source3/winbindd/winbindd_xids_to_sids.c
[3745/4194] Compiling source3/winbindd/winbindd_cred_cache.c
[3746/4194] Compiling source3/winbindd/winbindd_pam_chng_pswd_auth_crap.c=

[3747/4194] Compiling source3/winbindd/wb_sids2xids.c
[3748/4194] Compiling source3/winbindd/winbindd_ads.c
[3749/4194] Compiling source3/winbindd/winbindd_getdcname.c
[3750/4194] Compiling source3/winbindd/winbindd_idmap.c
[3751/4194] Compiling source3/winbindd/winbindd_wins_byname.c
[3752/4194] Compiling source3/winbindd/winbindd_ndr.c
[3753/4194] Compiling source3/winbindd/wb_seqnum.c
[3754/4194] Compiling source3/winbindd/wb_group_members.c
[3755/4194] Compiling source3/winbindd/winbindd_ccache_access.c
[3756/4194] Compiling source3/winbindd/winbindd_getgrnam.c
[3757/4194] Compiling source3/winbindd/winbindd_samr.c
[3758/4194] Compiling source3/winbindd/winbindd_lookupname.c
[3759/4194] Compiling source3/winbindd/winbindd_list_users.c
[3760/4194] Compiling source3/winbindd/winbindd_list_groups.c
[3761/4194] Compiling source3/winbindd/winbindd_msrpc.c
[3762/4194] Compiling source3/winbindd/winbindd_getuserdomgroups.c
[3763/4194] Compiling source3/winbindd/winbindd_group.c
[3764/4194] Compiling source3/winbindd/winbindd_getpwsid.c
[3765/4194] Compiling source3/winbindd/winbindd_getpwnam.c
[3766/4194] Compiling source3/winbindd/winbindd_ping_dc.c
[3767/4194] Compiling source3/winbindd/winbindd_sids_to_xids.c
[3768/4194] Compiling source3/winbindd/winbindd_lookupsid.c
[3769/4194] Compiling source3/winbindd/winbindd_wins_byip.c
[3770/4194] Compiling source3/winbindd/winbindd_dual.c
[3771/4194] Compiling source3/winbindd/winbindd_getpwent.c
[3772/4194] Compiling source3/winbindd/winbindd_async.c
[3773/4194] Compiling source3/winbindd/wb_gettoken.c
[3774/4194] Compiling source3/winbindd/winbindd_allocate_gid.c
[3775/4194] Compiling source3/winbindd/winbindd_locator.c
[3776/4194] Compiling source3/winbindd/winbindd_misc.c
[3777/4194] Compiling source3/winbindd/winbindd_setpwent.c
[3778/4194] Compiling source3/winbindd/winbindd_pam_chauthtok.c
[3779/4194] Compiling source3/winbindd/winbindd_getgrgid.c
[3780/4194] Compiling source3/winbindd/winbindd_util.c
[3781/4194] Compiling source3/winbindd/winbindd_getpwuid.c
[3782/4194] Compiling source3/winbindd/wb_getpwsid.c
[3783/4194] Compiling source3/winbindd/wb_seqnums.c
[3784/4194] Compiling source3/winbindd/winbindd_endpwent.c
[3785/4194] Compiling source3/winbindd/winbindd_pam_auth_crap.c
[3786/4194] Compiling source3/winbindd/winbindd_rpc.c
[3787/4194] Compiling source3/winbindd/wb_dsgetdcname.c
[3788/4194] Compiling source3/winbindd/winbindd_irpc.c
[3789/4194] Compiling source3/winbindd/winbindd_reconnect_ads.c
[3790/4194] Compiling source3/winbindd/wb_next_grent.c
[3791/4194] Compiling source3/winbindd/winbindd_creds.c
[3792/4194] Compiling source3/winbindd/winbindd_getusersids.c
[3793/4194] Compiling source3/winbindd/winbindd_check_machine_acct.c
[3794/4194] Compiling source3/winbindd/winbindd_change_machine_acct.c
[3795/4194] Compiling source3/winbindd/wb_query_group_list.c
[3796/4194] Compiling source3/winbindd/winbindd_pam.c
[3797/4194] Compiling source3/winbindd/winbindd_cm.c
[3798/4194] Compiling source3/winbindd/winbindd_allocate_uid.c
[3799/4194] Compiling source3/winbindd/winbindd_dual_ndr.c
[3800/4194] Compiling source3/winbindd/wb_lookupusergroups.c
[3801/4194] Compiling source3/winbindd/winbindd_domain_info.c
[3802/4194] Compiling source3/winbindd/winbindd_show_sequence.c
[3803/4194] Compiling source3/winbindd/wb_lookupsids.c
[3804/4194] Linking bin/default/source3/winbindd/winbindd
[3805/4194] Compiling examples/auth/auth_skel.c
[3806/4194] Compiling examples/libsmbclient/testsmbc.c
[3807/4194] Compiling examples/libsmbclient/testacl.c
[3808/4194] Compiling examples/libsmbclient/testacl2.c
[3809/4194] Compiling examples/libsmbclient/testacl3.c
[3810/4194] Compiling examples/libsmbclient/testbrowse.c
[3811/4194] Linking bin/default/examples/auth/libauth_module_skel.so
[3812/4194] Linking bin/default/examples/libsmbclient/testsmbc
[3813/4194] Linking bin/default/examples/libsmbclient/testacl
[3814/4194] Linking bin/default/examples/libsmbclient/testacl2
[3815/4194] Linking bin/default/examples/libsmbclient/testacl3
[3816/4194] Linking bin/default/examples/libsmbclient/testbrowse
[3817/4194] Compiling examples/libsmbclient/testbrowse2.c
[3818/4194] Compiling examples/libsmbclient/testnotify.c
[3819/4194] Compiling examples/libsmbclient/teststat.c
[3820/4194] Compiling examples/libsmbclient/teststat2.c
[3821/4194] Compiling examples/libsmbclient/teststat3.c
[3822/4194] Compiling examples/libsmbclient/teststatvfs.c
[3823/4194] Linking bin/default/examples/libsmbclient/testbrowse2
[3824/4194] Linking bin/default/examples/libsmbclient/testnotify
[3825/4194] Linking bin/default/examples/libsmbclient/teststat
[3826/4194] Linking bin/default/examples/libsmbclient/teststat2
[3827/4194] Linking bin/default/examples/libsmbclient/teststat3
[3828/4194] Linking bin/default/examples/libsmbclient/teststatvfs
[3829/4194] Compiling examples/libsmbclient/testfstatvfs.c
[3830/4194] Compiling examples/libsmbclient/testtruncate.c
[3831/4194] Compiling examples/libsmbclient/testchmod.c
[3832/4194] Compiling examples/libsmbclient/testutime.c
[3833/4194] Compiling examples/libsmbclient/testread.c
[3834/4194] Compiling examples/libsmbclient/testwrite.c
[3835/4194] Linking bin/default/examples/libsmbclient/testfstatvfs
[3836/4194] Linking bin/default/examples/libsmbclient/testtruncate
[3837/4194] Linking bin/default/examples/libsmbclient/testchmod
[3838/4194] Linking bin/default/examples/libsmbclient/testutime
[3839/4194] Linking bin/default/examples/libsmbclient/testread
[3840/4194] Linking bin/default/examples/libsmbclient/testwrite
[3841/4194] Compiling examples/libsmbclient/testctx.c
[3842/4194] Compiling examples/pdb/test.c
[3843/4194] Compiling examples/VFS/skel_opaque.c
[3844/4194] Compiling examples/VFS/skel_transparent.c
[3845/4194] Compiling examples/VFS/shadow_copy_test.c
[3846/4194] Compiling bin/default/examples/winexe/winexesvc32_exe_binary.=
c
[3847/4194] Linking bin/default/examples/libsmbclient/testctx
[3848/4194] Linking bin/default/examples/pdb/libpdb_module_test.so
[3849/4194] Linking bin/default/examples/VFS/libvfs_module_skel_opaque.so=

[3850/4194] Linking bin/default/examples/VFS/libvfs_module_skel_transpare=
nt.so
[3851/4194] Linking bin/default/examples/VFS/libvfs_module_shadow_copy_te=
st.so
[3852/4194] Compiling bin/default/examples/winexe/winexesvc64_exe_binary.=
c
[3853/4194] Compiling examples/winexe/winexe.c
[3854/4194] Compiling source3/lib/netapi/tests/common.c
[3855/4194] Compiling source3/lib/netapi/tests/netdisplay.c
[3856/4194] Compiling source3/lib/netapi/tests/netapitest.c
[3857/4194] Compiling source3/lib/netapi/tests/netuser.c
[3858/4194] Linking bin/default/examples/winexe/winexe
[3859/4194] Compiling source3/lib/netapi/tests/netshare.c
[3860/4194] Compiling source3/lib/netapi/tests/netfile.c
[3861/4194] Compiling source3/lib/netapi/tests/netwksta.c
[3862/4194] Compiling source3/lib/netapi/tests/netlocalgroup.c
[3863/4194] Compiling source3/lib/netapi/tests/netserver.c
[3864/4194] Compiling source3/lib/netapi/tests/netgroup.c
[3865/4194] Linking bin/default/source3/lib/netapi/tests/netapitest
[3866/4194] Compiling source3/lib/netapi/examples/getdc/getdc.c
[3867/4194] Compiling source3/lib/netapi/examples/dsgetdc/dsgetdc.c
[3868/4194] Compiling source3/lib/netapi/examples/join/netdomjoin.c
[3869/4194] Compiling source3/lib/netapi/examples/join/getjoinableous.c
[3870/4194] Compiling source3/lib/netapi/examples/join/getjoininformation=
=2Ec
[3871/4194] Compiling source3/lib/netapi/examples/join/rename_machine.c
[3872/4194] Linking bin/default/source3/lib/netapi/examples/getdc/getdc
[3873/4194] Linking bin/default/source3/lib/netapi/examples/dsgetdc/dsget=
dc
[3874/4194] Linking bin/default/source3/lib/netapi/examples/join/netdomjo=
in
[3875/4194] Linking bin/default/source3/lib/netapi/examples/join/getjoina=
bleous
[3876/4194] Linking bin/default/source3/lib/netapi/examples/join/getjoini=
nformation
[3877/4194] Linking bin/default/source3/lib/netapi/examples/join/rename_m=
achine
[3878/4194] Compiling source3/lib/netapi/examples/user/user_add.c
[3879/4194] Compiling source3/lib/netapi/examples/user/user_del.c
[3880/4194] Compiling source3/lib/netapi/examples/user/user_enum.c
[3881/4194] Compiling source3/lib/netapi/examples/user/user_dispinfo.c
[3882/4194] Compiling source3/lib/netapi/examples/user/user_chgpwd.c
[3883/4194] Compiling source3/lib/netapi/examples/user/user_getinfo.c
[3884/4194] Linking bin/default/source3/lib/netapi/examples/user/user_add=

[3885/4194] Linking bin/default/source3/lib/netapi/examples/user/user_del=

[3886/4194] Linking bin/default/source3/lib/netapi/examples/user/user_enu=
m
[3887/4194] Linking bin/default/source3/lib/netapi/examples/user/user_dis=
pinfo
[3888/4194] Linking bin/default/source3/lib/netapi/examples/user/user_chg=
pwd
[3889/4194] Linking bin/default/source3/lib/netapi/examples/user/user_get=
info
[3890/4194] Compiling source3/lib/netapi/examples/user/user_setinfo.c
[3891/4194] Compiling source3/lib/netapi/examples/user/user_modalsget.c
[3892/4194] Compiling source3/lib/netapi/examples/user/user_modalsset.c
[3893/4194] Compiling source3/lib/netapi/examples/user/user_getgroups.c
[3894/4194] Compiling source3/lib/netapi/examples/user/user_setgroups.c
[3895/4194] Compiling source3/lib/netapi/examples/user/user_getlocalgroup=
s.c
[3896/4194] Linking bin/default/source3/lib/netapi/examples/user/user_set=
info
[3897/4194] Linking bin/default/source3/lib/netapi/examples/user/user_mod=
alsget
[3898/4194] Linking bin/default/source3/lib/netapi/examples/user/user_mod=
alsset
[3899/4194] Linking bin/default/source3/lib/netapi/examples/user/user_get=
groups
[3900/4194] Linking bin/default/source3/lib/netapi/examples/user/user_set=
groups
[3901/4194] Linking bin/default/source3/lib/netapi/examples/user/user_get=
localgroups
[3902/4194] Compiling source3/lib/netapi/examples/group/group_add.c
[3903/4194] Compiling source3/lib/netapi/examples/group/group_del.c
[3904/4194] Compiling source3/lib/netapi/examples/group/group_enum.c
[3905/4194] Compiling source3/lib/netapi/examples/group/group_setinfo.c
[3906/4194] Compiling source3/lib/netapi/examples/group/group_getinfo.c
[3907/4194] Compiling source3/lib/netapi/examples/group/group_adduser.c
[3908/4194] Linking bin/default/source3/lib/netapi/examples/group/group_a=
dd
[3909/4194] Linking bin/default/source3/lib/netapi/examples/group/group_d=
el
[3910/4194] Linking bin/default/source3/lib/netapi/examples/group/group_e=
num
[3911/4194] Linking bin/default/source3/lib/netapi/examples/group/group_s=
etinfo
[3912/4194] Linking bin/default/source3/lib/netapi/examples/group/group_g=
etinfo
[3913/4194] Linking bin/default/source3/lib/netapi/examples/group/group_a=
dduser
[3914/4194] Compiling source3/lib/netapi/examples/group/group_deluser.c
[3915/4194] Compiling source3/lib/netapi/examples/group/group_getusers.c
[3916/4194] Compiling source3/lib/netapi/examples/group/group_setusers.c
[3917/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_a=
dd.c
[3918/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_d=
el.c
[3919/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_g=
etinfo.c
[3920/4194] Linking bin/default/source3/lib/netapi/examples/group/group_d=
eluser
[3921/4194] Linking bin/default/source3/lib/netapi/examples/group/group_g=
etusers
[3922/4194] Linking bin/default/source3/lib/netapi/examples/group/group_s=
etusers
[3923/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_add
[3924/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_del
[3925/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_getinfo
[3926/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_s=
etinfo.c
[3927/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_e=
num.c
[3928/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_a=
ddmembers.c
[3929/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_d=
elmembers.c
[3930/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_s=
etmembers.c
[3931/4194] Compiling source3/lib/netapi/examples/localgroup/localgroup_g=
etmembers.c
[3932/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_setinfo
[3933/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_enum
[3934/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_addmembers
[3935/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_delmembers
[3936/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_setmembers
[3937/4194] Linking bin/default/source3/lib/netapi/examples/localgroup/lo=
calgroup_getmembers
[3938/4194] Compiling source3/lib/netapi/examples/server/remote_tod.c
[3939/4194] Compiling source3/lib/netapi/examples/server/server_getinfo.c=

[3940/4194] Compiling source3/lib/netapi/examples/share/share_add.c
[3941/4194] Compiling source3/lib/netapi/examples/share/share_del.c
[3942/4194] Compiling source3/lib/netapi/examples/share/share_enum.c
[3943/4194] Compiling source3/lib/netapi/examples/share/share_getinfo.c
[3944/4194] Linking bin/default/source3/lib/netapi/examples/server/remote=
_tod
[3945/4194] Linking bin/default/source3/lib/netapi/examples/server/server=
_getinfo
[3946/4194] Linking bin/default/source3/lib/netapi/examples/share/share_a=
dd
[3947/4194] Linking bin/default/source3/lib/netapi/examples/share/share_d=
el
[3948/4194] Linking bin/default/source3/lib/netapi/examples/share/share_e=
num
[3949/4194] Linking bin/default/source3/lib/netapi/examples/share/share_g=
etinfo
[3950/4194] Compiling source3/lib/netapi/examples/share/share_setinfo.c
[3951/4194] Compiling source3/lib/netapi/examples/file/file_close.c
[3952/4194] Compiling source3/lib/netapi/examples/file/file_getinfo.c
[3953/4194] Compiling source3/lib/netapi/examples/file/file_enum.c
[3954/4194] Compiling source3/lib/netapi/examples/shutdown/shutdown_init.=
c
[3955/4194] Compiling source3/lib/netapi/examples/shutdown/shutdown_abort=
=2Ec
[3956/4194] Linking bin/default/source3/lib/netapi/examples/share/share_s=
etinfo
[3957/4194] Linking bin/default/source3/lib/netapi/examples/file/file_clo=
se
[3958/4194] Linking bin/default/source3/lib/netapi/examples/file/file_get=
info
[3959/4194] Linking bin/default/source3/lib/netapi/examples/file/file_enu=
m
[3960/4194] Linking bin/default/source3/lib/netapi/examples/shutdown/shut=
down_init
[3961/4194] Linking bin/default/source3/lib/netapi/examples/shutdown/shut=
down_abort
[3962/4194] Compiling source3/lib/netapi/examples/netlogon/netlogon_contr=
ol.c
[3963/4194] Compiling source3/lib/netapi/examples/netlogon/netlogon_contr=
ol2.c
[3964/4194] Compiling source3/lib/netapi/examples/netlogon/nltest.c
[3965/4194] Compiling source3/smbd/notifyd/tests.c
[3966/4194] Compiling source3/smbd/notifyd/notifydd.c
[3967/4194] Compiling source3/rpcclient/rpcclient.c
[3968/4194] Linking bin/default/source3/lib/netapi/examples/netlogon/netl=
ogon_control
[3969/4194] Linking bin/default/source3/lib/netapi/examples/netlogon/netl=
ogon_control2
[3970/4194] Linking bin/default/source3/lib/netapi/examples/netlogon/nlte=
st
[3971/4194] Linking bin/default/source3/smbd/notifyd/notifyd-tests
[3972/4194] Linking bin/default/source3/smbd/notifyd/notifydd
[3973/4194] Compiling source3/rpcclient/cmd_epmapper.c
[3974/4194] Compiling source3/rpcclient/cmd_wkssvc.c
[3975/4194] Compiling source3/rpcclient/cmd_dfs.c
[3976/4194] Compiling source3/rpcclient/cmd_samr.c
[3977/4194] Compiling source3/rpcclient/cmd_ntsvcs.c
[3978/4194] Compiling source3/rpcclient/cmd_lsarpc.c
[3979/4194] Compiling source3/rpcclient/cmd_eventlog.c
[3980/4194] Compiling source3/rpcclient/cmd_fss.c
[3981/4194] Compiling source3/rpcclient/cmd_witness.c
[3982/4194] Compiling source3/rpcclient/cmd_winreg.c
[3983/4194] Compiling source3/rpcclient/cmd_echo.c
[3984/4194] Compiling source3/rpcclient/cmd_netlogon.c
[3985/4194] Compiling source3/rpcclient/cmd_clusapi.c
[3986/4194] Compiling source3/rpcclient/cmd_iremotewinspool.c
[3987/4194] Compiling source3/rpcclient/cmd_dssetup.c
[3988/4194] Compiling source3/rpcclient/cmd_drsuapi.c
[3989/4194] Compiling source3/rpcclient/cmd_shutdown.c
[3990/4194] Compiling source3/rpcclient/cmd_srvsvc.c
[3991/4194] Compiling source3/rpcclient/cmd_spoolss.c
[3992/4194] Compiling source3/rpcclient/cmd_test.c
[3993/4194] Linking bin/default/source3/rpcclient/rpcclient
[3994/4194] Compiling source3/utils/profiles.c
[3995/4194] Compiling source3/utils/smbcontrol.c
[3996/4194] Compiling source3/utils/smbtree.c
[3997/4194] Compiling source3/utils/smbpasswd.c
[3998/4194] Compiling source3/utils/pdbedit.c
[3999/4194] Compiling source3/utils/smbget.c
[4000/4194] Linking bin/default/source3/utils/profiles
[4001/4194] Linking bin/default/source3/utils/smbcontrol
[4002/4194] Linking bin/default/source3/utils/smbtree
[4003/4194] Linking bin/default/source3/utils/smbpasswd
[4004/4194] Linking bin/default/source3/utils/pdbedit
[4005/4194] Linking bin/default/source3/utils/smbget
[4006/4194] Compiling source3/utils/nmblookup.c
[4007/4194] Compiling source3/lib/util_sd.c
[4008/4194] Compiling source3/utils/smbcacls.c
[4009/4194] Compiling source3/utils/smbcquotas.c
[4010/4194] Compiling source3/utils/eventlogadm.c
[4011/4194] Compiling source3/utils/sharesec.c
[4012/4194] Linking bin/default/source3/utils/nmblookup
[4013/4194] Linking bin/default/source3/utils/smbcacls
[4014/4194] Compiling source3/lib/util_sd.c
[4015/4194] Linking bin/default/source3/utils/smbcquotas
[4016/4194] Linking bin/default/source3/utils/eventlogadm
[4017/4194] Linking bin/default/source3/utils/sharesec
[4018/4194] Compiling source3/utils/log2pcaphex.c
[4019/4194] Compiling source3/utils/debugparse.c
[4020/4194] Compiling source3/utils/debug2html.c
[4021/4194] Compiling source3/utils/smbfilter.c
[4022/4194] Compiling source3/utils/ntlm_auth_diagnostics.c
[4023/4194] Compiling source3/utils/ntlm_auth.c
[4024/4194] Linking bin/default/source3/utils/log2pcap
[4025/4194] Linking bin/default/source3/utils/debug2html
[4026/4194] Compiling source3/utils/dbwrap_tool.c
[4027/4194] Linking bin/default/source3/utils/smbfilter
[4028/4194] Linking bin/default/source3/utils/ntlm_auth
[4029/4194] Compiling source3/utils/dbwrap_torture.c
[4030/4194] Compiling source3/utils/split_tokens.c
[4031/4194] Compiling source3/utils/regedit_wrap.c
[4032/4194] Linking bin/default/source3/utils/dbwrap_tool
[4033/4194] Compiling source3/utils/regedit_samba3.c
[4034/4194] Compiling source3/utils/regedit_treeview.c
[4035/4194] Linking bin/default/source3/utils/dbwrap_torture
[4036/4194] Linking bin/default/source3/utils/split_tokens
[4037/4194] Compiling source3/utils/regedit_hexedit.c
[4038/4194] Compiling source3/utils/regedit_dialog.c
[4039/4194] Compiling source3/utils/regedit_valuelist.c
[4040/4194] Compiling source3/utils/regedit.c
[4041/4194] Compiling source3/utils/regedit_list.c
[4042/4194] Compiling source3/utils/testparm.c
[4043/4194] Linking bin/default/source3/utils/samba-regedit
[4044/4194] Compiling source3/utils/net_rpc_audit.c
[4045/4194] Compiling source3/utils/net_rpc_rights.c
[4046/4194] Compiling source3/utils/netlookup.c
[4047/4194] Compiling source3/utils/net_printing.c
[4048/4194] Linking bin/default/source3/utils/testparm
[4049/4194] Compiling source3/utils/net_notify.c
[4050/4194] Compiling source3/utils/net_rpc_service.c
[4051/4194] Compiling source3/registry/reg_format.c
[4052/4194] Compiling source3/utils/net_idmap_check.c
[4053/4194] Compiling source3/utils/net_registry_check.c
[4054/4194] Compiling source3/utils/net_time.c
[4055/4194] Compiling source3/utils/net_rpc.c
[4056/4194] Compiling source3/utils/net_status.c
[4057/4194] Compiling source3/utils/net_rpc_samsync.c
[4058/4194] Compiling source3/registry/reg_import.c
[4059/4194] Compiling source3/utils/net_rap.c
[4060/4194] Compiling source3/utils/net_rpc_conf.c
[4061/4194] Compiling source3/utils/net_sam.c
[4062/4194] Compiling source3/utils/net_rpc_sh_acct.c
[4063/4194] Compiling source3/utils/net_registry.c
[4064/4194] Compiling source3/utils/net_help.c
[4065/4194] Compiling source3/utils/net_rpc_shell.c
[4066/4194] Compiling source3/utils/net_share.c
[4067/4194] Compiling source3/utils/net_g_lock.c
[4068/4194] Compiling source3/utils/net_cache.c
[4069/4194] Compiling source3/utils/net_dns.c
[4070/4194] Compiling source3/utils/net_conf_util.c
[4071/4194] Compiling source3/utils/net_groupmap.c
[4072/4194] Compiling source3/utils/net_rpc_printer.c
[4073/4194] Compiling source3/utils/net.c
[4074/4194] Compiling source3/utils/interact.c
[4075/4194] Compiling source3/utils/net_tdb.c
[4076/4194] Compiling source3/utils/net_group.c
[4077/4194] Compiling source3/utils/net_rpc_trust.c
[4078/4194] Compiling source3/utils/net_help_common.c
[4079/4194] Compiling source3/utils/net_join.c
[4080/4194] Compiling source3/utils/net_file.c
[4081/4194] Compiling source3/utils/net_eventlog.c
[4082/4194] Compiling source3/utils/net_conf.c
[4083/4194] Compiling source3/utils/net_usershare.c
[4084/4194] Compiling source3/utils/net_ads.c
[4085/4194] Compiling source3/utils/net_user.c
[4086/4194] Compiling source3/utils/net_registry_util.c
[4087/4194] Compiling source3/utils/net_util.c
[4088/4194] Compiling source3/utils/net_lookup.c
[4089/4194] Compiling source3/utils/net_dom.c
[4090/4194] Compiling source3/utils/net_serverid.c
[4091/4194] Compiling source3/utils/net_rpc_registry.c
[4092/4194] Compiling source3/registry/reg_parse.c
[4093/4194] Compiling source3/utils/net_afs.c
[4094/4194] Compiling source3/utils/net_idmap.c
[4095/4194] Compiling source3/utils/net_ads_gpo.c
[4096/4194] Linking bin/default/source3/utils/net
[4097/4194] Compiling source3/utils/mvxattr.c
[4098/4194] Compiling source3/utils/destroy_netlogon_creds_cli.c
[4099/4194] Compiling source3/smbd/notify_msg.c
[4100/4194] Compiling source3/utils/status_profile.c
[4101/4194] Compiling source3/utils/status.c
[4102/4194] Compiling source3/nmbd/nmbd_browserdb.c
[4103/4194] Linking bin/default/source3/utils/mvxattr
[4104/4194] Linking bin/default/source3/utils/destroy_netlogon_creds_cli
[4105/4194] Linking bin/default/source3/utils/smbstatus
[4106/4194] Compiling source3/nmbd/nmbd_nodestatus.c
[4107/4194] Compiling source3/nmbd/nmbd_subnetdb.c
[4108/4194] Compiling source3/nmbd/nmbd.c
[4109/4194] Compiling source3/nmbd/nmbd_workgroupdb.c
[4110/4194] Compiling source3/nmbd/nmbd_mynames.c
[4111/4194] Compiling source3/nmbd/nmbd_processlogon.c
[4112/4194] Compiling source3/nmbd/nmbd_winsproxy.c
[4113/4194] Compiling source3/nmbd/nmbd_become_lmb.c
[4114/4194] Compiling source3/nmbd/nmbd_lmhosts.c
[4115/4194] Compiling source3/nmbd/nmbd_serverlistdb.c
[4116/4194] Compiling source3/nmbd/nmbd_responserecordsdb.c
[4117/4194] Compiling source3/nmbd/nmbd_winsserver.c
[4118/4194] Compiling source3/nmbd/nmbd_namequery.c
[4119/4194] Compiling source3/nmbd/nmbd_incomingrequests.c
[4120/4194] Compiling source3/nmbd/nmbd_synclists.c
[4121/4194] Compiling source3/nmbd/nmbd_become_dmb.c
[4122/4194] Compiling source3/nmbd/nmbd_nameregister.c
[4123/4194] Compiling source3/nmbd/nmbd_browsesync.c
[4124/4194] Compiling source3/nmbd/nmbd_packets.c
[4125/4194] Compiling source3/nmbd/nmbd_sendannounce.c
[4126/4194] Compiling source3/nmbd/nmbd_namerelease.c
[4127/4194] Compiling source3/nmbd/nmbd_logonnames.c
[4128/4194] Compiling source3/nmbd/nmbd_elections.c
[4129/4194] Compiling source3/nmbd/nmbd_namelistdb.c
[4130/4194] Compiling source3/nmbd/nmbd_incomingdgrams.c
[4131/4194] Compiling source3/nmbd/asyncdns.c
[4132/4194] Linking bin/default/source3/nmbd/nmbd
[4133/4194] Compiling file_server/file_server.c
[4134/4194] Compiling testsuite/headers/test_headers.c
[4135/4194] Compiling source4/lib/com/tables.c
[4136/4194] Compiling source4/lib/com/main.c
[4137/4194] Compiling source4/lib/com/rot.c
[4138/4194] Compiling source4/lib/com/classes/simple.c
[4139/4194] Linking bin/default/file_server/libservice_module_s3fs.so
[4140/4194] Linking bin/default/testsuite/headers/test_headers
[4141/4194] Compiling bin/default/librpc/gen_ndr/ndr_w32time_c.c
[4142/4194] Processing bin/default/lib/talloc/libtalloc.so
[4143/4194] Symlinking bin/default/lib/talloc/libtalloc.so
[4144/4194] Processing bin/default/lib/talloc/libpytalloc-util.cpython-36=
m-x86-64-linux-gnu.so
[4145/4194] Symlinking bin/default/lib/talloc/libpytalloc-util.cpython-36=
m-x86-64-linux-gnu.so
[4146/4194] Symlinking bin/default/lib/tevent/libtevent.so
[4147/4194] Processing bin/default/lib/tevent/libtevent.so
[4148/4194] Processing bin/default/lib/tdb/libtdb.so
[4149/4194] Symlinking bin/default/lib/tdb/libtdb.so
[4150/4194] Symlinking bin/default/lib/ldb/libpyldb-util.cpython-36m-x86-=
64-linux-gnu.so
[4151/4194] Processing bin/default/lib/ldb/libpyldb-util.cpython-36m-x86-=
64-linux-gnu.so
[4152/4194] Processing bin/default/lib/ldb/libldb.so
[4153/4194] Symlinking bin/default/lib/ldb/libldb.so
[4154/4194] Symlinking bin/default/lib/param/libsamba-hostconfig.so
[4155/4194] Symlinking bin/default/source4/librpc/libdcerpc-samr.so
[4156/4194] Symlinking bin/default/source4/librpc/libdcerpc.so
[4157/4194] Symlinking bin/default/source4/dsdb/libsamdb.so
[4158/4194] Symlinking bin/default/auth/credentials/libsamba-credentials.=
so
[4159/4194] Symlinking bin/default/nsswitch/libnss-wrapper-winbind.so
[4160/4194] Symlinking bin/default/nsswitch/libnss_winbind.so
[4161/4194] Symlinking bin/default/nsswitch/libnss_wins.so
[4162/4194] Symlinking bin/default/nsswitch/libwbclient/libwbclient.so
[4163/4194] Processing bin/default/nsswitch/libwbclient/libwbclient.so
[4164/4194] Symlinking bin/default/lib/util/libsamba-util.so
[4165/4194] Symlinking bin/default/lib/util/libtevent-util.so
[4166/4194] Symlinking bin/default/source4/rpc_server/libdcerpc-server.so=

[4167/4194] Symlinking bin/default/librpc/libndr-krb5pac.so
[4168/4194] Symlinking bin/default/librpc/libndr-standard.so
[4169/4194] Symlinking bin/default/librpc/libndr-nbt.so
[4170/4194] Processing bin/default/librpc/libndr.so
[4171/4194] Symlinking bin/default/librpc/libndr.so
[4172/4194] Symlinking bin/default/librpc/libdcerpc-binding.so
[4173/4194] Symlinking bin/default/libcli/util/libsamba-errors.so
[4174/4194] Symlinking bin/default/source4/lib/policy/libsamba-policy.cpy=
thon-36m-x86-64-linux-gnu.so
[4175/4194] Symlinking bin/default/source4/heimdal_build/libroken-samba4.=
so
[4176/4194] Symlinking bin/default/source4/heimdal_build/libkdc-samba4.so=

[4177/4194] Symlinking bin/default/source4/heimdal_build/libheimntlm-samb=
a4.so
[4178/4194] Symlinking bin/default/source4/heimdal_build/libhdb-samba4.so=

[4179/4194] Symlinking bin/default/source4/heimdal_build/libgssapi-samba4=
=2Eso
[4180/4194] Symlinking bin/default/source4/heimdal_build/libkrb5-samba4.s=
o
[4181/4194] Symlinking bin/default/source4/heimdal_build/libasn1-samba4.s=
o
[4182/4194] Symlinking bin/default/source4/heimdal_build/libhcrypto-samba=
4.so
[4183/4194] Symlinking bin/default/source4/heimdal_build/libheimbase-samb=
a4.so
[4184/4194] Symlinking bin/default/source4/heimdal_build/libhx509-samba4.=
so
[4185/4194] Symlinking bin/default/source4/heimdal_build/libwind-samba4.s=
o
[4186/4194] Symlinking bin/default/source4/heimdal_build/libcom_err-samba=
4.so
[4187/4194] Symlinking bin/default/source3/libnetapi.so
[4188/4194] Processing bin/default/source3/libsamba-passdb.so
[4189/4194] Symlinking bin/default/source3/libsamba-passdb.so
[4190/4194] Processing bin/default/source3/libsmbldap.so
[4191/4194] Symlinking bin/default/source3/libsmbldap.so
[4192/4194] Symlinking bin/default/source3/libsmbconf.so
[4193/4194] Symlinking bin/default/source3/libsmb/libsmbclient.so
[4194/4194] Processing bin/default/source3/libsmb/libsmbclient.so
[4195/4315] Processing manpages/smb.conf.5: docs-xml/manpages/smb.conf.5.=
xml bin/default/docs-xml/smbdotconf/parameters.all.xml -> bin/default/doc=
s-xml/manpages/smb.conf.5

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smb.conf.5


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4196/4315] Compiling docs-xml/manpages/cifsdd.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing cifsdd.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4197/4315] Compiling docs-xml/manpages/dbwrap_tool.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing dbwrap_tool.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4198/4315] Compiling docs-xml/manpages/eventlogadm.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing eventlogadm.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4199/4315] Compiling docs-xml/manpages/findsmb.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing findsmb.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4200/4315] Compiling docs-xml/manpages/idmap_ad.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_ad.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4201/4315] Compiling docs-xml/manpages/idmap_autorid.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_autorid.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4202/4315] Compiling docs-xml/manpages/idmap_hash.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_hash.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4203/4315] Compiling docs-xml/manpages/idmap_ldap.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_ldap.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4204/4315] Compiling docs-xml/manpages/idmap_nss.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_nss.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4205/4315] Compiling docs-xml/manpages/idmap_rfc2307.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_rfc2307.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4206/4315] Compiling docs-xml/manpages/idmap_rid.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_rid.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4207/4315] Compiling docs-xml/manpages/idmap_script.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_script.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4208/4315] Compiling docs-xml/manpages/idmap_tdb.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_tdb.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4209/4315] Compiling docs-xml/manpages/idmap_tdb2.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing idmap_tdb2.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4210/4315] Compiling docs-xml/manpages/libsmbclient.7.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing libsmbclient.7


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4211/4315] Compiling docs-xml/manpages/lmhosts.5.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing lmhosts.5


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4212/4315] Compiling docs-xml/manpages/log2pcap.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing log2pcap.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4213/4315] Compiling docs-xml/manpages/mvxattr.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing mvxattr.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4214/4315] Compiling docs-xml/manpages/net.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing net.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4215/4315] Compiling docs-xml/manpages/nmbd.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing nmbd.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4216/4315] Compiling docs-xml/manpages/nmblookup.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing nmblookup.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4217/4315] Compiling docs-xml/manpages/ntlm_auth.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ntlm_auth.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4218/4315] Compiling docs-xml/manpages/pdbedit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing pdbedit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4219/4315] Compiling docs-xml/manpages/profiles.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing profiles.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4220/4315] Compiling docs-xml/manpages/rpcclient.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing rpcclient.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4221/4315] Compiling docs-xml/manpages/samba-regedit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing samba-regedit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4222/4315] Compiling docs-xml/manpages/samba-tool.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing samba-tool.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4223/4315] Compiling docs-xml/manpages/samba.7.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing samba.7


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4224/4315] Compiling docs-xml/manpages/samba.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing samba.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4225/4315] Compiling docs-xml/manpages/sharesec.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing sharesec.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4226/4315] Compiling docs-xml/manpages/smbcacls.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbcacls.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4227/4315] Compiling docs-xml/manpages/smbclient.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbclient.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4228/4315] Compiling docs-xml/manpages/smbcontrol.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbcontrol.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4229/4315] Compiling docs-xml/manpages/smbcquotas.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbcquotas.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4230/4315] Compiling docs-xml/manpages/smbd.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbd.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4231/4315] Compiling docs-xml/manpages/smbget.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbget.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4232/4315] Compiling docs-xml/manpages/smbgetrc.5.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbgetrc.5


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4233/4315] Compiling docs-xml/manpages/smbpasswd.5.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbpasswd.5


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4234/4315] Compiling docs-xml/manpages/smbpasswd.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbpasswd.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4235/4315] Compiling docs-xml/manpages/smbspool_krb5_wrapper.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbspool_krb5_wrapper.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4236/4315] Compiling docs-xml/manpages/smbspool.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbspool.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4237/4315] Compiling docs-xml/manpages/smbstatus.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbstatus.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4238/4315] Compiling docs-xml/manpages/smbtar.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbtar.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4239/4315] Compiling docs-xml/manpages/smbtree.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbtree.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4240/4315] Compiling docs-xml/manpages/testparm.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing testparm.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4241/4315] Compiling docs-xml/manpages/traffic_learner.7.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing traffic_learner.7


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4242/4315] Compiling docs-xml/manpages/traffic_replay.7.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing traffic_replay.7


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4243/4315] Compiling docs-xml/manpages/vfstest.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfstest.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4244/4315] Compiling docs-xml/manpages/wbinfo.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing wbinfo.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4245/4315] Compiling docs-xml/manpages/winbindd.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing winbindd.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4246/4315] Compiling docs-xml/manpages/pam_winbind.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing pam_winbind.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4247/4315] Compiling docs-xml/manpages/pam_winbind.conf.5.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing pam_winbind.conf.5


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4248/4315] Compiling docs-xml/manpages/winbind_krb5_locator.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing winbind_krb5_locator.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4249/4315] Compiling docs-xml/manpages/vfs_acl_tdb.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_acl_tdb.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4250/4315] Compiling docs-xml/manpages/vfs_acl_xattr.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_acl_xattr.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4251/4315] Compiling docs-xml/manpages/vfs_aio_fork.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_aio_fork.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4252/4315] Compiling docs-xml/manpages/vfs_aio_pthread.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_aio_pthread.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4253/4315] Compiling docs-xml/manpages/vfs_audit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_audit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4254/4315] Compiling docs-xml/manpages/vfs_btrfs.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_btrfs.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4255/4315] Compiling docs-xml/manpages/vfs_cap.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_cap.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4256/4315] Compiling docs-xml/manpages/vfs_catia.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_catia.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4257/4315] Compiling docs-xml/manpages/vfs_ceph.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_ceph.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4258/4315] Compiling docs-xml/manpages/vfs_ceph_snapshots.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_ceph_snapshots.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4259/4315] Compiling docs-xml/manpages/vfs_commit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_commit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4260/4315] Compiling docs-xml/manpages/vfs_crossrename.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_crossrename.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4261/4315] Compiling docs-xml/manpages/vfs_default_quota.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_default_quota.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4262/4315] Compiling docs-xml/manpages/vfs_dirsort.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_dirsort.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4263/4315] Compiling docs-xml/manpages/vfs_extd_audit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_extd_audit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4264/4315] Compiling docs-xml/manpages/vfs_fake_perms.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_fake_perms.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4265/4315] Compiling docs-xml/manpages/vfs_fileid.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_fileid.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4266/4315] Compiling docs-xml/manpages/vfs_fruit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_fruit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4267/4315] Compiling docs-xml/manpages/vfs_full_audit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_full_audit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4268/4315] Compiling docs-xml/manpages/vfs_glusterfs.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_glusterfs.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4269/4315] Compiling docs-xml/manpages/vfs_glusterfs_fuse.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_glusterfs_fuse.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4270/4315] Compiling docs-xml/manpages/vfs_gpfs.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_gpfs.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4271/4315] Compiling docs-xml/manpages/vfs_linux_xfs_sgid.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_linux_xfs_sgid.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4272/4315] Compiling docs-xml/manpages/vfs_media_harmony.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_media_harmony.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4273/4315] Compiling docs-xml/manpages/vfs_netatalk.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_netatalk.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4274/4315] Compiling docs-xml/manpages/vfs_nfs4acl_xattr.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_nfs4acl_xattr.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4275/4315] Compiling docs-xml/manpages/vfs_offline.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_offline.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4276/4315] Compiling docs-xml/manpages/vfs_preopen.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_preopen.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4277/4315] Compiling docs-xml/manpages/vfs_readahead.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_readahead.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4278/4315] Compiling docs-xml/manpages/vfs_readonly.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_readonly.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4279/4315] Compiling docs-xml/manpages/vfs_recycle.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_recycle.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4280/4315] Compiling docs-xml/manpages/vfs_shadow_copy.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_shadow_copy.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4281/4315] Compiling docs-xml/manpages/vfs_shadow_copy2.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_shadow_copy2.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4282/4315] Compiling docs-xml/manpages/vfs_shell_snap.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_shell_snap.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4283/4315] Compiling docs-xml/manpages/vfs_snapper.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_snapper.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4284/4315] Compiling docs-xml/manpages/vfs_streams_depot.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_streams_depot.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4285/4315] Compiling docs-xml/manpages/vfs_streams_xattr.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_streams_xattr.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4286/4315] Compiling docs-xml/manpages/vfs_syncops.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_syncops.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4287/4315] Compiling docs-xml/manpages/vfs_time_audit.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_time_audit.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4288/4315] Compiling docs-xml/manpages/vfs_unityed_media.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_unityed_media.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4289/4315] Compiling docs-xml/manpages/vfs_virusfilter.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_virusfilter.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4290/4315] Compiling docs-xml/manpages/vfs_worm.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_worm.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4291/4315] Compiling docs-xml/manpages/vfs_xattr_tdb.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing vfs_xattr_tdb.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4292/4315] Compiling lib/talloc/man/talloc.3.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing talloc.3


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4293/4315] Compiling lib/tdb/man/tdbrestore.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing tdbrestore.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4294/4315] Compiling lib/tdb/man/tdbdump.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing tdbdump.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4295/4315] Compiling lib/tdb/man/tdbbackup.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing tdbbackup.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4296/4315] Compiling lib/tdb/man/tdbtool.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing tdbtool.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4297/4315] Compiling lib/ldb/man/ldb.3.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldb.3


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4298/4315] Compiling lib/ldb/man/ldbadd.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldbadd.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4299/4315] Compiling lib/ldb/man/ldbsearch.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldbsearch.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4300/4315] Compiling lib/ldb/man/ldbdel.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldbdel.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4301/4315] Compiling lib/ldb/man/ldbmodify.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldbmodify.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4302/4315] Compiling lib/ldb/man/ldbedit.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldbedit.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4303/4315] Compiling lib/ldb/man/ldbrename.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ldbrename.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4304/4315] Compiling librpc/tools/ndrdump.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing ndrdump.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4305/4315] Compiling source4/lib/registry/man/regdiff.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing regdiff.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4306/4315] Compiling source4/lib/registry/man/regpatch.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing regpatch.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4307/4315] Compiling source4/lib/registry/man/regshell.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing regshell.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4308/4315] Compiling source4/lib/registry/man/regtree.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing regtree.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4309/4315] Compiling source4/utils/oLschema2ldif/oLschema2ldif.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing oLschema2ldif.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4310/4315] Compiling source4/torture/man/smbtorture.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing smbtorture.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4311/4315] Compiling source4/torture/man/gentest.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing gentest.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4312/4315] Compiling source4/torture/man/masktest.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing masktest.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4313/4315] Compiling source4/torture/man/locktest.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing locktest.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4314/4315] Compiling libcli/nbt/man/nmblookup4.1.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing nmblookup4.1


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4315/4315] Compiling source4/scripting/man/samba-gpupdate.8.xml

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Note: Writing samba-gpupdate.8


=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Waf: Leaving directory `/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/de=
fault'
'build' finished successfully (14m17.211s)
samba-ad-dc-backup: [test] Running make test FAIL_IMMEDIATELY=3D1 TESTS=3D=
'--include-env=3Dbackupfromdc --include-env=3Drestoredc --include-env=3Dr=
enamedc --include-env=3Dofflinebackupdc --include-env=3Dlabdc --include-e=
nv=3Dad_dc_backup' in '/tmp/samba-testbase/b22/samba-ad-dc-backup/.'
PYTHONHASHSEED=3D1 WAF_MAKE=3D1  ./buildtools/bin/waf test=20
'test' finished successfully (0.020s)
Waf: Entering directory `/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/d=
efault'
	Selected embedded Heimdal build
Waf: Leaving directory `/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/de=
fault'
'build' finished successfully (16.908s)
test: running (/usr/bin/perl /tmp/samba-testbase/b22/samba-ad-dc-backup/s=
elftest/selftest.pl --target=3Dsamba --prefix=3D./bin/ab --srcdir=3D/tmp/=
samba-testbase/b22/samba-ad-dc-backup --exclude=3D/tmp/samba-testbase/b22=
/samba-ad-dc-backup/selftest/skip --testlist=3D"/usr/bin/python3 /tmp/sam=
ba-testbase/b22/samba-ad-dc-backup/selftest/tests.py|" --testlist=3D"/usr=
/bin/python3 /tmp/samba-testbase/b22/samba-ad-dc-backup/source3/selftest/=
tests.py|" --testlist=3D"/usr/bin/python3 /tmp/samba-testbase/b22/samba-a=
d-dc-backup/source4/selftest/tests.py|"  --exclude=3D/tmp/samba-testbase/=
b22/samba-ad-dc-backup/selftest/slow --nss_wrapper_so_path=3D/tmp/samba-t=
estbase/b22/samba-ad-dc-backup/bin/default/third_party/nss_wrapper/libnss=
-wrapper.so --resolv_wrapper_so_path=3D/tmp/samba-testbase/b22/samba-ad-d=
c-backup/bin/default/third_party/resolv_wrapper/libresolv-wrapper.so --ui=
d_wrapper_so_path=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/defaul=
t/third_party/uid_wrapper/libuid-wrapper.so --socket_wrapper_so_path=3D/t=
mp/samba-testbase/b22/samba-ad-dc-backup/bin/default/third_party/socket_w=
rapper/libsocket-wrapper.so --use-dns-faking --socket-wrapper --include-e=
nv=3Dbackupfromdc --include-env=3Drestoredc --include-env=3Drenamedc --in=
clude-env=3Dofflinebackupdc --include-env=3Dlabdc --include-env=3Dad_dc_b=
ackup && touch ./bin/ab/st_done) | /usr/bin/python3 -u /tmp/samba-testbas=
e/b22/samba-ad-dc-backup/selftest/filter-subunit --expected-failures=3D/t=
mp/samba-testbase/b22/samba-ad-dc-backup/selftest/knownfail --expected-fa=
ilures=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/knownfail.d =
--flapping=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/flapping=
 --flapping=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/flappin=
g.d --fail-immediately | tee ./bin/ab/subunit | /usr/bin/python3 -u /tmp/=
samba-testbase/b22/samba-ad-dc-backup/selftest/format-subunit --prefix=3D=
=2E/bin/ab --immediate
LD_PRELOAD=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/default/third=
_party/nss_wrapper/libnss-wrapper.so:/tmp/samba-testbase/b22/samba-ad-dc-=
backup/bin/default/third_party/resolv_wrapper/libresolv-wrapper.so:/tmp/s=
amba-testbase/b22/samba-ad-dc-backup/bin/default/third_party/socket_wrapp=
er/libsocket-wrapper.so:/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/de=
fault/third_party/uid_wrapper/libuid-wrapper.so
SOCKET_WRAPPER_DIR=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/w
DNS: Faking nameserver

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
skipping subunit (testscenarios not available)
OPTIONS --configfile=3D$SMB_CONF_PATH --option=3D'fss:sequence timeout=3D=
1' --maximum-runtime=3D$SELFTEST_MAXTIME --basedir=3D$SELFTEST_TMPDIR --f=
ormat=3Dsubunit --option=3Dtorture:progress=3Dno

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
STARTING dnshub for dns_hub...DONE (19762)
PROVISIONING AD DC...

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
dns_hub will proxy DNS requests for the following realms:
  labdom.samba.example.com =3D=3D> 127.0.0.43
  backupdom.samba.example.com =3D=3D> 127.0.0.40
  chgdcpassword.samba.example.com =3D=3D> 127.0.0.32
  samba2008r2.example.com =3D=3D> 127.0.0.27
  samba2000.example.com =3D=3D> 127.0.0.25
  sub.samba.example.com =3D=3D> 127.0.0.31
  samba2003.example.com =3D=3D> 127.0.0.26
  adnonssdom.samba.example.com =3D=3D> 127.0.0.17
  renamedom.samba.example.com =3D=3D> 127.0.0.42
  schema.samba.example.com =3D=3D> 127.0.0.48
  adnontlmdom.samba.example.com =3D=3D> 127.0.0.18
  addom.samba.example.com =3D=3D> 127.0.0.30
  samba.example.com =3D=3D> 127.0.0.21
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
Unable to determine the DomainSID, can not enforce uniqueness constraint =
on local domainSIDs

Repack: re-packed 10000 records so far
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
WARNING: The "server schannel" option is deprecated
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
WARNING: The "server schannel" option is deprecated
Repacking database with format 0x26011968
Repacking database with format 0x26011968
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
User 'testallowed' created successfully
WARNING: The "server schannel" option is deprecated
Modified 1 records successfully
WARNING: The "server schannel" option is deprecated
Modified 1 records successfully

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
User 'testdenied' created successfully
WARNING: The "server schannel" option is deprecated
Modified 1 records successfully

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
User 'testupnspn' created successfully
WARNING: The "server schannel" option is deprecated
Modified 1 records successfully

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Added members to group Allowed RODC Password Replication Group

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
User 'alice' created successfully

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
User 'bob' created successfully

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
User 'jane' created successfully
WARNING: The "server schannel" option is deprecated
Modified 1 records successfully
STARTING samba for backupfromdc...DONE (19929)
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 19929 was called with maxruntime 18000 - curr=
ent ts 1561710922
binary_smbd_main: samba: using 'prefork' process model
Attempting to autogenerate TLS self-signed keys for https for hostname 'B=
ACKUPFROMDC.backupdom.samba.example.com'
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: WARNING: The "server=
 schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: WARNING: The "se=
rver schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: WARNING: The "server=
 schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 19943
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: WARNING: The "se=
rver schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
python3: WARNING: The "server schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Lookup failed - NT_STATUS_HOST_UNREACHABLE
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
WARNING: The "server schannel" option is deprecated
127.0.0.40 BACKUPFROMDC<00>
waiting for working LDAP and a RID Set to be allocated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Failed to connect to ldap URL 'ldap://backupfromdc' - LDAP client interna=
l error: NT_STATUS_HOST_UNREACHABLE
Failed to connect to 'ldap://backupfromdc' with backend 'ldap': LDAP clie=
nt internal error: NT_STATUS_HOST_UNREACHABLE
Failed to connect to ldap://backupfromdc - LDAP client internal error: NT=
_STATUS_HOST_UNREACHABLE

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Waiting for working LDAP...

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Failed to connect to ldap URL 'ldap://backupfromdc' - LDAP client interna=
l error: NT_STATUS_HOST_UNREACHABLE
Failed to connect to 'ldap://backupfromdc' with backend 'ldap': LDAP clie=
nt internal error: NT_STATUS_HOST_UNREACHABLE
Failed to connect to ldap://backupfromdc - LDAP client internal error: NT=
_STATUS_HOST_UNREACHABLE

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Waiting for working LDAP...

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
TLS self-signed keys generated OK

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
checking the NETLOGON for domain[BACKUPDOMAIN] dc connection to "backupfr=
omdc.backupdom.samba.example.com" succeeded
Waiting for dns_update_cache to be created.
Waiting for dns_update_cache to be filled.
SAMBA LOG of: BACKUPFROMDC pid 19929
WARNING: The "server schannel" option is deprecated
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 19929 was called with maxruntime 18000 - curr=
ent ts 1561710922
binary_smbd_main: samba: using 'prefork' process model
Attempting to autogenerate TLS self-signed keys for https for hostname 'B=
ACKUPFROMDC.backupdom.samba.example.com'
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: WARNING: The "server=
 schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: WARNING: The "se=
rver schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: WARNING: The "server=
 schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 19943
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: WARNING: The "se=
rver schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
python3: WARNING: The "server schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!
TLS self-signed keys generated OK
READY (19929)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
LocalDomain Netbios[BACKUPDOMAIN] DNS[backupdom.samba.example.com] SID[S-=
1-5-21-264282618-3230820166-2525618018]
Own forest trust information...
Namespaces[2] TDO[backupdom.samba.example.com]:
TLN: Status[Enabled]                  DNS[*.backupdom.samba.example.com]
DOM: Status[Enabled]                  DNS[backupdom.samba.example.com] Ne=
tbios[BACKUPDOMAIN] SID[S-1-5-21-264282618-3230820166-2525618018]
Stored uPNSuffixes attributes[0]:
Stored msDS-SPNSuffixes attributes[0]:
Update uPNSuffixes attributes[1]:
TLN:                                  DNS[*.BACKUPDOM.SAMBA.EXAMPLE.COM.u=
pn]
Update msDS-SPNSuffixes attributes[1]:
TLN:                                  DNS[*.BACKUPDOM.SAMBA.EXAMPLE.COM.s=
pn]
Stored forest trust information...
Namespaces[4] TDO[backupdom.samba.example.com]:
TLN: Status[Enabled]                  DNS[*.backupdom.samba.example.com]
DOM: Status[Enabled]                  DNS[backupdom.samba.example.com] Ne=
tbios[BACKUPDOMAIN] SID[S-1-5-21-264282618-3230820166-2525618018]
TLN: Status[Enabled]                  DNS[*.BACKUPDOM.SAMBA.EXAMPLE.COM.s=
pn]
TLN: Status[Enabled]                  DNS[*.BACKUPDOM.SAMBA.EXAMPLE.COM.u=
pn]
Preparing OFFLINE BACKUP DC...
Executing: NSS_WRAPPER_HOSTS=3D'/tmp/samba-testbase/b22/samba-ad-dc-backu=
p/bin/ab/hosts' SOCKET_WRAPPER_DEFAULT_IFACE=3D"44" RESOLV_WRAPPER_HOSTS=3D=
"/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/dns_host_file"  KRB5_C=
ONFIG=3D"/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/backupfromdc/e=
tc/krb5.conf" KRB5CCNAME=3D"/tmp/samba-testbase/b22/samba-ad-dc-backup/bi=
n/ab/offlinebackupdc/krb5_ccache"  python3 ./bin/samba-tool domain backup=
 offline -s /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/backupfromd=
c/etc/smb.conf --targetdir=3D/tmp/samba-testbase/b22/samba-ad-dc-backup/b=
in/ab/tmp/tc9VkRUPjA

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
running backup on dirs: /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab=
/backupfromdc/private /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/b=
ackupfromdc/statedir /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/ba=
ckupfromdc/etc
Starting transaction on /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab=
/backupfromdc/private/secrets
MDB backend detected.  Using mdb backup function.
   backing up /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/backupfro=
mdc/private/sam.ldb
   copying locked/related file /tmp/samba-testbase/b22/samba-ad-dc-backup=
/bin/ab/backupfromdc/private/sam.ldb.d/DC=3DDOMAINDNSZONES,DC=3DBACKUPDOM=
,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock
   copying locked/related file /tmp/samba-testbase/b22/samba-ad-dc-backup=
/bin/ab/backupfromdc/private/sam.ldb.d/DC=3DBACKUPDOM,DC=3DSAMBA,DC=3DEXA=
MPLE,DC=3DCOM.ldb-lock
   copying locked/related file /tmp/samba-testbase/b22/samba-ad-dc-backup=
/bin/ab/backupfromdc/private/sam.ldb.d/DC=3DFORESTDNSZONES,DC=3DBACKUPDOM=
,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock
   backing up locked/related file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/backupfromdc/private/sam.ldb.d/CN=3DCONFIGURATION,DC=3DBACKUPD=
OM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb
   copying locked/related file /tmp/samba-testbase/b22/samba-ad-dc-backup=
/bin/ab/backupfromdc/private/sam.ldb.d/CN=3DSCHEMA,CN=3DCONFIGURATION,DC=3D=
BACKUPDOM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock
   copying locked/related file /tmp/samba-testbase/b22/samba-ad-dc-backup=
/bin/ab/backupfromdc/private/sam.ldb.d/metadata.tdb
   backing up locked/related file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/backupfromdc/private/sam.ldb.d/DC=3DFORESTDNSZONES,DC=3DBACKUP=
DOM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb
   backing up locked/related file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/backupfromdc/private/sam.ldb.d/DC=3DBACKUPDOM,DC=3DSAMBA,DC=3D=
EXAMPLE,DC=3DCOM.ldb
   backing up locked/related file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/backupfromdc/private/sam.ldb.d/CN=3DSCHEMA,CN=3DCONFIGURATION,=
DC=3DBACKUPDOM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb
   backing up locked/related file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/backupfromdc/private/sam.ldb.d/DC=3DDOMAINDNSZONES,DC=3DBACKUP=
DOM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb
   copying locked/related file /tmp/samba-testbase/b22/samba-ad-dc-backup=
/bin/ab/backupfromdc/private/sam.ldb.d/CN=3DCONFIGURATION,DC=3DBACKUPDOM,=
DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock
Starting transaction on solo db: /tmp/samba-testbase/b22/samba-ad-dc-back=
up/bin/ab/backupfromdc/private/share.ldb
   running tdbbackup on the same file
Starting transaction on solo db: /tmp/samba-testbase/b22/samba-ad-dc-back=
up/bin/ab/backupfromdc/private/hklm.ldb
   running tdbbackup on the same file
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/private/schannel_store.tdb
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/private/netlogon_creds_cli.tdb
tdb_mutex_open_ok[/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/backu=
pfromdc/private/netlogon_creds_cli.tdb]: Can use mutexes only with MUTEX_=
LOCKING or NOLOCK
Failed to open /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/backupfr=
omdc/private/netlogon_creds_cli.tdb
Starting transaction on solo db: /tmp/samba-testbase/b22/samba-ad-dc-back=
up/bin/ab/backupfromdc/private/privilege.ldb
   running tdbbackup on the same file
Starting transaction on solo db: /tmp/samba-testbase/b22/samba-ad-dc-back=
up/bin/ab/backupfromdc/private/wins_config.ldb
   running tdbbackup on the same file
Starting transaction on solo db: /tmp/samba-testbase/b22/samba-ad-dc-back=
up/bin/ab/backupfromdc/private/idmap.ldb
   running tdbbackup on the same file
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/statedir/share_info.tdb
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/statedir/registry.tdb
Starting transaction on solo db: /tmp/samba-testbase/b22/samba-ad-dc-back=
up/bin/ab/backupfromdc/statedir/wins.ldb
   running tdbbackup on the same file
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/statedir/winbindd_cache.tdb
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/statedir/xattr.tdb
running tdbbackup on lone tdb file /tmp/samba-testbase/b22/samba-ad-dc-ba=
ckup/bin/ab/backupfromdc/statedir/account_policy.tdb
running offline ntacl backup of sysvol

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
building backup tar
   adding misc file private/krb5.conf
   adding backup private/secrets.tdb.bak-offline to tar and deleting file=

   adding backup private/share.ldb.bak-offline to tar and deleting file
   adding misc file private/ldapi
   adding backup private/hklm.ldb.bak-offline to tar and deleting file
   adding backup private/schannel_store.tdb.bak-offline to tar and deleti=
ng file
   adding misc file private/secrets.keytab
   adding misc file private/dns_update_cache
   adding misc file private/dns_update_list
   skipping private/netlogon_creds_cli.tdb
   adding backup private/privilege.ldb.bak-offline to tar and deleting fi=
le
   adding backup private/sam.ldb.bak-offline to tar and deleting file
   adding backup private/wins_config.ldb.bak-offline to tar and deleting =
file
   adding backup private/secrets.ldb.bak-offline to tar and deleting file=

   adding backup private/idmap.ldb.bak-offline to tar and deleting file
   adding misc file private/spn_update_list
   adding misc file private/encrypted_secrets.key
   adding misc file private/ldap_priv/ldapi
   adding backup private/sam.ldb.d/DC=3DDOMAINDNSZONES,DC=3DBACKUPDOM,DC=3D=
SAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock.bak-offline to tar and deleting file=

   adding backup private/sam.ldb.d/DC=3DBACKUPDOM,DC=3DSAMBA,DC=3DEXAMPLE=
,DC=3DCOM.ldb-lock.bak-offline to tar and deleting file
   adding backup private/sam.ldb.d/DC=3DFORESTDNSZONES,DC=3DBACKUPDOM,DC=3D=
SAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock.bak-offline to tar and deleting file=

   adding backup private/sam.ldb.d/CN=3DCONFIGURATION,DC=3DBACKUPDOM,DC=3D=
SAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb.bak-offline to tar and deleting file
   adding backup private/sam.ldb.d/CN=3DSCHEMA,CN=3DCONFIGURATION,DC=3DBA=
CKUPDOM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock.bak-offline to tar and =
deleting file
   adding backup private/sam.ldb.d/metadata.tdb.bak-offline to tar and de=
leting file
   adding backup private/sam.ldb.d/DC=3DFORESTDNSZONES,DC=3DBACKUPDOM,DC=3D=
SAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb.bak-offline to tar and deleting file
   adding backup private/sam.ldb.d/DC=3DBACKUPDOM,DC=3DSAMBA,DC=3DEXAMPLE=
,DC=3DCOM.ldb.bak-offline to tar and deleting file
   adding backup private/sam.ldb.d/CN=3DSCHEMA,CN=3DCONFIGURATION,DC=3DBA=
CKUPDOM,DC=3DSAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb.bak-offline to tar and delet=
ing file
   adding backup private/sam.ldb.d/DC=3DDOMAINDNSZONES,DC=3DBACKUPDOM,DC=3D=
SAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb.bak-offline to tar and deleting file
   adding backup private/sam.ldb.d/CN=3DCONFIGURATION,DC=3DBACKUPDOM,DC=3D=
SAMBA,DC=3DEXAMPLE,DC=3DCOM.ldb-lock.bak-offline to tar and deleting file=

   adding misc file private/tls/dhparms.pem
   adding misc file private/tls/cert.pem
   adding misc file private/tls/key.pem
   adding misc file private/tls/ca.pem
   adding backup statedir/share_info.tdb.bak-offline to tar and deleting =
file
   adding backup statedir/registry.tdb.bak-offline to tar and deleting fi=
le
   adding backup statedir/wins.ldb.bak-offline to tar and deleting file
   adding backup statedir/winbindd_cache.tdb.bak-offline to tar and delet=
ing file
   adding backup statedir/xattr.tdb.bak-offline to tar and deleting file
   adding backup statedir/account_policy.tdb.bak-offline to tar and delet=
ing file
   adding misc file statedir/winbindd_privileged/pipe
   adding misc file etc/krb5.conf
   adding misc file etc/mitkdc.conf
   adding misc file etc/smb.conf
   adding misc file etc/group
   adding misc file etc/passwd
Backup succeeded.
Using backup file /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/tmp/t=
c9VkRUPjA/samba-backup-2019-06-28T08-35-33.637913.tar.bz2...
Executing: python3 ./bin/samba-tool domain backup restore --backup-file=3D=
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/tmp/tc9VkRUPjA/samba-ba=
ckup-2019-06-28T08-35-33.637913.tar.bz2 --targetdir=3D/tmp/samba-testbase=
/b22/samba-ad-dc-backup/bin/ab/offlinebackupdc --newservername=3Dofflineb=
ackupdc --host-ip=3D127.0.0.44 --configfile=3D/tmp/samba-testbase/b22/sam=
ba-ad-dc-backup/bin/ab/tmp/LUMnIl2h3X/smb.conf
Using /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/tmp/LUMnIl2h3X/sm=
b.conf as restored domain's smb.conf

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Doing a full scan on DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and =
looking for deleted objects

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Creating default site 'Default-First-Site-Name'
Adding new DC to site 'Default-First-Site-Name'
Updating basic smb.conf settings...
Creating account with SID: S-1-5-21-264282618-3230820166-2525618018-1109
Adding CN=3DOFFLINEBACKUPDC,OU=3DDomain Controllers,DC=3Dbackupdom,DC=3Ds=
amba,DC=3Dexample,DC=3Dcom
Adding CN=3DOFFLINEBACKUPDC,CN=3DServers,CN=3DDefault-First-Site-Name,CN=3D=
Sites,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
Adding CN=3DNTDS Settings,CN=3DOFFLINEBACKUPDC,CN=3DServers,CN=3DDefault-=
First-Site-Name,CN=3DSites,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,D=
C=3Dexample,DC=3Dcom
Adding SPNs to CN=3DOFFLINEBACKUPDC,OU=3DDomain Controllers,DC=3Dbackupdo=
m,DC=3Dsamba,DC=3Dexample,DC=3Dcom
Setting account password for OFFLINEBACKUPDC$
Enabling account
Seizing rid FSMO role...
FSMO seize of 'rid' role successful
Seizing pdc FSMO role...
FSMO seize of 'pdc' role successful
Seizing naming FSMO role...
FSMO seize of 'naming' role successful
Seizing infrastructure FSMO role...
FSMO seize of 'infrastructure' role successful
Seizing schema FSMO role...
FSMO seize of 'schema' role successful
Removing nTDSDSA: CN=3DNTDS Settings,CN=3DBACKUPFROMDC,CN=3DServers,CN=3D=
Backup-Site,CN=3DSites,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3D=
example,DC=3Dcom (and any children)
Removing RID Set: CN=3DRID Set,CN=3DBACKUPFROMDC,OU=3DDomain Controllers,=
DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
Removing computer account: CN=3DBACKUPFROMDC,OU=3DDomain Controllers,DC=3D=
backupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom (and any child objects)
checking for DNS records to remove on ForestDnsZones.backupdom.samba.exam=
ple.com
updating ForestDnsZones.backupdom.samba.example.com keeping 0 values, rem=
oving 2 values
checking for DNS records to remove on backupdom.samba.example.com
updating backupdom.samba.example.com keeping 2 values, removing 2 values
checking for DNS records to remove on DomainDnsZones.backupdom.samba.exam=
ple.com
updating DomainDnsZones.backupdom.samba.example.com keeping 0 values, rem=
oving 2 values
checking DC=3Dbackupdom.samba.example.com,CN=3DMicrosoftDNS,DC=3DDomainDn=
sZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
updating DC=3D@,DC=3Dbackupdom.samba.example.com,CN=3DMicrosoftDNS,DC=3DD=
omainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom keeping 1 v=
alues, removing 1 values
updating DC=3D_ldap._tcp.Backup-Site._sites.ForestDnsZones,DC=3Dbackupdom=
=2Esamba.example.com,CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom=
,DC=3Dsamba,DC=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.Backup-Site._sites,DC=3Dbackupdom.samba.example.=
com,CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3D=
example,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_kpasswd._udp,DC=3Dbackupdom.samba.example.com,CN=3DMicroso=
ftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
 keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.DomainDnsZones,DC=3Dbackupdom.samba.example.com,=
CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_msdcs,DC=3Dbackupdom.samba.example.com,CN=3DMicrosoftDNS,D=
C=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom keepin=
g 0 values, removing 1 values
updating DC=3D_gc._tcp,DC=3Dbackupdom.samba.example.com,CN=3DMicrosoftDNS=
,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom keep=
ing 0 values, removing 1 values
updating DC=3D_ldap._tcp,DC=3Dbackupdom.samba.example.com,CN=3DMicrosoftD=
NS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom ke=
eping 0 values, removing 1 values
updating DC=3D_kerberos._tcp.Backup-Site._sites,DC=3Dbackupdom.samba.exam=
ple.com,CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,D=
C=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_kpasswd._tcp,DC=3Dbackupdom.samba.example.com,CN=3DMicroso=
ftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
 keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.ForestDnsZones,DC=3Dbackupdom.samba.example.com,=
CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_kerberos._udp,DC=3Dbackupdom.samba.example.com,CN=3DMicros=
oftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dco=
m keeping 0 values, removing 1 values
updating DC=3D_gc._tcp.Backup-Site._sites,DC=3Dbackupdom.samba.example.co=
m,CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.Backup-Site._sites.DomainDnsZones,DC=3Dbackupdom=
=2Esamba.example.com,CN=3DMicrosoftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom=
,DC=3Dsamba,DC=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_kerberos._tcp,DC=3Dbackupdom.samba.example.com,CN=3DMicros=
oftDNS,DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dco=
m keeping 0 values, removing 1 values
checking DC=3D_msdcs.backupdom.samba.example.com,CN=3DMicrosoftDNS,DC=3DF=
orestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
updating DC=3D_ldap._tcp.gc,DC=3D_msdcs.backupdom.samba.example.com,CN=3D=
MicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.335a9df4-2824-4a5b-86f7-7d9b8ad37c00.domains,DC=3D=
_msdcs.backupdom.samba.example.com,CN=3DMicrosoftDNS,DC=3DForestDnsZones,=
DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom keeping 0 values, removin=
g 1 values
updating DC=3D_kerberos._tcp.Backup-Site._sites.dc,DC=3D_msdcs.backupdom.=
samba.example.com,CN=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=
=3Dsamba,DC=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.dc,DC=3D_msdcs.backupdom.samba.example.com,CN=3D=
MicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.Backup-Site._sites.dc,DC=3D_msdcs.backupdom.samb=
a.example.com,CN=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Ds=
amba,DC=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_ldap._tcp.pdc,DC=3D_msdcs.backupdom.samba.example.com,CN=3D=
MicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom keeping 0 values, removing 1 values
updating DC=3Df1746513-ea66-4533-b288-64a851afbdc2,DC=3D_msdcs.backupdom.=
samba.example.com,CN=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=
=3Dsamba,DC=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D@,DC=3D_msdcs.backupdom.samba.example.com,CN=3DMicrosoftDNS=
,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom keep=
ing 1 values, removing 1 values
updating DC=3D_ldap._tcp.Backup-Site._sites.gc,DC=3D_msdcs.backupdom.samb=
a.example.com,CN=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Ds=
amba,DC=3Dexample,DC=3Dcom keeping 0 values, removing 1 values
updating DC=3D_kerberos._tcp.dc,DC=3D_msdcs.backupdom.samba.example.com,C=
N=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexamp=
le,DC=3Dcom keeping 0 values, removing 1 values
Removing Sysvol reference: CN=3DBACKUPFROMDC,CN=3DEnterprise,CN=3DMicroso=
ft System Volumes,CN=3DSystem,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamb=
a,DC=3Dexample,DC=3Dcom
Removing Sysvol reference: CN=3DBACKUPFROMDC,CN=3Dbackupdom.samba.example=
=2Ecom,CN=3DMicrosoft System Volumes,CN=3DSystem,CN=3DConfiguration,DC=3D=
backupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
Removing Sysvol reference: CN=3DBACKUPFROMDC,CN=3DDomain System Volumes (=
SYSVOL share),CN=3DFile Replication Service,CN=3DSystem,DC=3Dbackupdom,DC=
=3Dsamba,DC=3Dexample,DC=3Dcom
Removing Sysvol reference: CN=3DBACKUPFROMDC,CN=3DTopology,CN=3DDomain Sy=
stem Volume,CN=3DDFSR-GlobalSettings,CN=3DSystem,DC=3Dbackupdom,DC=3Dsamb=
a,DC=3Dexample,DC=3Dcom

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Fixing up any remaining references to the old DCs...
Backup file successfully restored to /tmp/samba-testbase/b22/samba-ad-dc-=
backup/bin/ab/offlinebackupdc
Please check the smb.conf settings are correct before starting samba.
Restore complete
STARTING samba for offlinebackupdc...DONE (20069)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 20069 was called with maxruntime 18000 - curr=
ent ts 1561710943
binary_smbd_main: samba: using 'prefork' process model
Error registering BACKUPDOMAIN<1b> with 127.0.0.44 on interface 127.255.2=
55.255 - NT_STATUS_CONFLICTING_ADDRESSES
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 20081
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
Lookup failed - NT_STATUS_HOST_UNREACHABLE
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
127.0.0.44 OFFLINEBACKUPDC<00>
waiting for working LDAP and a RID Set to be allocated
checking the NETLOGON for domain[BACKUPDOMAIN] dc connection to "offlineb=
ackupdc.backupdom.samba.example.com" succeeded
Waiting for dns_update_cache to be created.
Waiting for dns_update_cache to be filled.
SAMBA LOG of: OFFLINEBACKUPDC pid 20069
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 20069 was called with maxruntime 18000 - curr=
ent ts 1561710943
binary_smbd_main: samba: using 'prefork' process model
Error registering BACKUPDOMAIN<1b> with 127.0.0.44 on interface 127.255.2=
55.255 - NT_STATUS_CONFLICTING_ADDRESSES
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 20081
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!
READY (20069)
[1(0)/49 at 0s] samba.tests.samba_tool.gpo(offlinebackupdc:local)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Doing a full scan on DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and =
looking for deleted objects
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:36:17,163 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #804: New realm for backed up domain: renamedom.samba.example.com
INFO 2019-06-28 08:36:17,164 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #805: New base DN for backed up domain: DC=3Drenamedom,DC=3Dsamba,=
DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:17,164 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #806: New domain NetBIOS name: RENAMEDOMAIN
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:36:17,343 pid:20315 bin/python/samba/provision/__init_=
_.py #2098: Looking up IPv4 addresses
WARNING 2019-06-28 08:36:17,343 pid:20315 bin/python/samba/provision/__in=
it__.py #2108: No IPv4 address will be assigned
INFO 2019-06-28 08:36:17,344 pid:20315 bin/python/samba/provision/__init_=
_.py #2115: Looking up IPv6 addresses
INFO 2019-06-28 08:36:17,836 pid:20315 bin/python/samba/provision/__init_=
_.py #2288: Setting up share.ldb
INFO 2019-06-28 08:36:17,841 pid:20315 bin/python/samba/provision/__init_=
_.py #2292: Setting up secrets.ldb
INFO 2019-06-28 08:36:17,847 pid:20315 bin/python/samba/provision/__init_=
_.py #2298: Setting up the registry
INFO 2019-06-28 08:36:17,858 pid:20315 bin/python/samba/provision/__init_=
_.py #2301: Setting up the privileges database
INFO 2019-06-28 08:36:17,864 pid:20315 bin/python/samba/provision/__init_=
_.py #2304: Setting up idmap db
INFO 2019-06-28 08:36:17,882 pid:20315 bin/python/samba/provision/__init_=
_.py #2311: Setting up SAM db
INFO 2019-06-28 08:36:17,883 pid:20315 bin/python/samba/provision/__init_=
_.py #892: Setting up sam.ldb partitions and settings
INFO 2019-06-28 08:36:17,885 pid:20315 bin/python/samba/provision/__init_=
_.py #904: Setting up sam.ldb rootDSE
INFO 2019-06-28 08:36:17,888 pid:20315 bin/python/samba/provision/__init_=
_.py #1312: Pre-loading the Samba 4 and AD schema
Unable to determine the DomainSID, can not enforce uniqueness constraint =
on local domainSIDs

INFO 2019-06-28 08:36:17,909 pid:20315 bin/python/samba/provision/__init_=
_.py #2361: A Kerberos configuration suitable for Samba AD has been gener=
ated at /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/tmp/c5plcHYp4M/=
tmp1uhskngh/private/krb5.conf
INFO 2019-06-28 08:36:17,910 pid:20315 bin/python/samba/provision/__init_=
_.py #2362: Merge the contents of this file with your system krb5.conf or=
 replace it with this one. Do not create a symlink!
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[402/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[804/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[1206/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[1608/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[1739/1739] linked_values[0/0]
Analyze and apply schema objects
Partition[CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[402/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[804/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[1206/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[1608/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[1622/1622] linked_values[18/18]
Partition[DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom] objects[101/96=
] linked_values[24/24]
Partition[DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom] objects[218/21=
8] linked_values[24/24]
Partition[DC=3DDomainDnsZones,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[40/40] linked_values[0/0]
Partition[DC=3DForestDnsZones,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[18/18] linked_values[0/0]
Repacking database with format 0x26011968
Repack: re-packed 10000 records so far
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
INFO 2019-06-28 08:36:27,514 pid:20315 bin/python/samba/join.py #1648: Se=
tting isSynchronized and dsServiceName
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:36:28,248 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding DomainDnsZones.renamedom.samba.example.com dnsRoot to=
 CN=3Dd2d16fef-8020-4284-b1a0-31657d0afad2,CN=3DPartitions,CN=3DConfigura=
tion,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,252 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing DomainDnsZones.backupdom.samba.example.com dnsRoot =
from CN=3Dd2d16fef-8020-4284-b1a0-31657d0afad2,CN=3DPartitions,CN=3DConfi=
guration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,255 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding renamedom.samba.example.com dnsRoot to CN=3DBACKUPDOM=
AIN,CN=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexa=
mple,DC=3Dcom
INFO 2019-06-28 08:36:28,257 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing backupdom.samba.example.com dnsRoot from CN=3DBACKU=
PDOMAIN,CN=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3D=
example,DC=3Dcom
INFO 2019-06-28 08:36:28,259 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding ForestDnsZones.renamedom.samba.example.com dnsRoot to=
 CN=3Da53f24fc-614d-42dc-ac85-bd873dcef75c,CN=3DPartitions,CN=3DConfigura=
tion,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,261 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing ForestDnsZones.backupdom.samba.example.com dnsRoot =
from CN=3Da53f24fc-614d-42dc-ac85-bd873dcef75c,CN=3DPartitions,CN=3DConfi=
guration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,263 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding renamedom.samba.example.com dnsRoot to CN=3DEnterpris=
e Schema,CN=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3D=
example,DC=3Dcom
INFO 2019-06-28 08:36:28,265 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing backupdom.samba.example.com dnsRoot from CN=3DEnter=
prise Schema,CN=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba=
,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,267 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding renamedom.samba.example.com dnsRoot to CN=3DEnterpris=
e Configuration,CN=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsa=
mba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,269 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing backupdom.samba.example.com dnsRoot from CN=3DEnter=
prise Configuration,CN=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3D=
samba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:36:28,272 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #743: Changing backup domain's NetBIOS name to RENAMEDOMAIN
INFO 2019-06-28 08:36:28,274 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #753: Renaming CN=3DBACKUPDOMAIN,CN=3DPartitions,CN=3DConfiguratio=
n,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom --> CN=3DRENAMEDOMAIN,C=
N=3DPartitions,CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,=
DC=3Dcom
INFO 2019-06-28 08:36:28,278 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #760: Deleting old DNS zone DC=3Dbackupdom.samba.example.com,CN=3D=
MicrosoftDNS,DC=3DDomainDnsZones,DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom
INFO 2019-06-28 08:36:28,350 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #766: Deleting old DNS zone DC=3D_msdcs.backupdom.samba.example.co=
m,CN=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Drenamedom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom
INFO 2019-06-28 08:36:28,395 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #871: Fixing DN attributes after rename...
INFO 2019-06-28 08:36:40,165 pid:20315 bin/python/samba/netcmd/domain_bac=
kup.py #124: Creating backup file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/tmp/c5plcHYp4M/samba-backup-renamedom.samba.example.com-2019-0=
6-28T08-36-28.109054.tar.bz2...
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 20323 was called with maxruntime 18000 - curr=
ent ts 1561711013
binary_smbd_main: samba: using 'prefork' process model
Attempting to autogenerate TLS self-signed keys for https for hostname 'R=
ENAMEDC.renamedom.samba.example.com'
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 20335
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!
TLS self-signed keys generated OK

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[2(12)/49 at 1m14s] samba.tests.samba_tool.gpo(renamedc:local)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Doing a full scan on DC=3DForestDnsZones,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Drenamedom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Drenamedom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and =
looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Drenamedom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom and looking for deleted objects
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:37:27,760 pid:20572 bin/python/samba/join.py #1554: wo=
rkgroup is BACKUPDOMAIN
INFO 2019-06-28 08:37:27,760 pid:20572 bin/python/samba/join.py #1557: re=
alm is backupdom.samba.example.com
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:37:27,839 pid:20572 bin/python/samba/provision/__init_=
_.py #2098: Looking up IPv4 addresses
WARNING 2019-06-28 08:37:27,840 pid:20572 bin/python/samba/provision/__in=
it__.py #2108: No IPv4 address will be assigned
INFO 2019-06-28 08:37:27,840 pid:20572 bin/python/samba/provision/__init_=
_.py #2115: Looking up IPv6 addresses
INFO 2019-06-28 08:37:28,185 pid:20572 bin/python/samba/provision/__init_=
_.py #2288: Setting up share.ldb
INFO 2019-06-28 08:37:28,195 pid:20572 bin/python/samba/provision/__init_=
_.py #2292: Setting up secrets.ldb
INFO 2019-06-28 08:37:28,201 pid:20572 bin/python/samba/provision/__init_=
_.py #2298: Setting up the registry
INFO 2019-06-28 08:37:28,215 pid:20572 bin/python/samba/provision/__init_=
_.py #2301: Setting up the privileges database
INFO 2019-06-28 08:37:28,220 pid:20572 bin/python/samba/provision/__init_=
_.py #2304: Setting up idmap db
INFO 2019-06-28 08:37:28,243 pid:20572 bin/python/samba/provision/__init_=
_.py #2311: Setting up SAM db
INFO 2019-06-28 08:37:28,245 pid:20572 bin/python/samba/provision/__init_=
_.py #892: Setting up sam.ldb partitions and settings
INFO 2019-06-28 08:37:28,247 pid:20572 bin/python/samba/provision/__init_=
_.py #904: Setting up sam.ldb rootDSE
INFO 2019-06-28 08:37:28,250 pid:20572 bin/python/samba/provision/__init_=
_.py #1312: Pre-loading the Samba 4 and AD schema
Unable to determine the DomainSID, can not enforce uniqueness constraint =
on local domainSIDs

INFO 2019-06-28 08:37:28,271 pid:20572 bin/python/samba/provision/__init_=
_.py #2361: A Kerberos configuration suitable for Samba AD has been gener=
ated at /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/tmp/_ANff635cE/=
tmp09ft281e/private/krb5.conf
INFO 2019-06-28 08:37:28,272 pid:20572 bin/python/samba/provision/__init_=
_.py #2362: Merge the contents of this file with your system krb5.conf or=
 replace it with this one. Do not create a symlink!
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[402/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[804/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[1206/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[1608/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom] objects[1739/1739] linked_values[0/0]
Analyze and apply schema objects
Partition[CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[402/1622] linked_values[0/1]
Partition[CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[804/1622] linked_values[0/1]
Partition[CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[1206/1622] linked_values[0/1]
Partition[CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[1608/1622] linked_values[0/1]
Partition[CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[1622/1622] linked_values[18/18]
Partition[DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom] objects[96/96]=
 linked_values[24/24]
Partition[DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom] objects[218/21=
8] linked_values[24/24]
Partition[DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[40/40] linked_values[0/0]
Partition[DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com] objects[18/18] linked_values[0/0]
Repacking database with format 0x26011968
Repack: re-packed 10000 records so far
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
INFO 2019-06-28 08:37:37,635 pid:20572 bin/python/samba/join.py #1648: Se=
tting isSynchronized and dsServiceName
INFO 2019-06-28 08:37:37,637 pid:20572 bin/python/samba/join.py #1560: Cl=
oned domain BACKUPDOMAIN (SID S-1-5-21-264282618-3230820166-2525618018)
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:37:38,489 pid:20572 bin/python/samba/netcmd/domain_bac=
kup.py #124: Creating backup file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/tmp/_ANff635cE/samba-backup-backupdom.samba.example.com-2019-0=
6-28T08-37-38.373114.tar.bz2...
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 20580 was called with maxruntime 18000 - curr=
ent ts 1561711068
binary_smbd_main: samba: using 'prefork' process model
Attempting to autogenerate TLS self-signed keys for https for hostname 'R=
ESTOREDC.backupdom.samba.example.com'
Error registering BACKUPDOMAIN<1b> with 127.0.0.41 on interface 127.255.2=
55.255 - NT_STATUS_CONFLICTING_ADDRESSES
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 20592
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!
TLS self-signed keys generated OK

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[3(24)/49 at 2m25s] samba.tests.samba_tool.gpo(restoredc:local)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Doing a full scan on DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and =
looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom and looking for deleted objects

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[4(36)/49 at 3m20s] samba.tests.smb(restoredc)
[5(44)/49 at 3m23s] samba.tests.ntacls_backup(restoredc:local)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
Unable to determine the DomainSID, can not enforce uniqueness constraint =
on local domainSIDs

Repack: re-packed 10000 records so far
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
WARNING: The "server schannel" option is deprecated
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
WARNING: The "server schannel" option is deprecated
Repacking database with format 0x26011968
Repacking database with format 0x26011968
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 21031 was called with maxruntime 18000 - curr=
ent ts 1561711130
binary_smbd_main: samba: using 'prefork' process model
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: WARNING: The "server=
 schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: WARNING: The "se=
rver schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: WARNING: The "server=
 schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 21043
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: WARNING: The "se=
rver schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
python3: WARNING: The "server schannel" option is deprecated
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!
WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[6(49)/49 at 3m26s] samba.tests.domain_backup(ad_dc_backup:local)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
Doing a full scan on DC=3DForestDnsZones,DC=3Daddom,DC=3Dsamba,DC=3Dexamp=
le,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Daddom,DC=3Dsamba,DC=3Dexamp=
le,DC=3Dcom and looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Daddom,DC=3Dsamba,DC=3Dexampl=
e,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Daddom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and look=
ing for deleted objects
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[7(65)/49 at 12m33s] samba.tests.domain_backup(restoredc:local)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[8(81)/49 at 18m41s] samba4.blackbox.ldapcmp_restore(offlinebackupdc)
[9(82)/49 at 18m49s] samba4.blackbox.ldapcmp_restore(restoredc)
[10(83)/49 at 18m53s] samba4.blackbox.ldapcmp_restore(renamedc)

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:53:58,402 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #804: New realm for backed up domain: labdom.samba.example.com
INFO 2019-06-28 08:53:58,402 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #805: New base DN for backed up domain: DC=3Dlabdom,DC=3Dsamba,DC=3D=
example,DC=3Dcom
INFO 2019-06-28 08:53:58,403 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #806: New domain NetBIOS name: LABDOMAIN
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:53:58,807 pid:22218 bin/python/samba/provision/__init_=
_.py #2098: Looking up IPv4 addresses
WARNING 2019-06-28 08:53:58,808 pid:22218 bin/python/samba/provision/__in=
it__.py #2108: No IPv4 address will be assigned
INFO 2019-06-28 08:53:58,808 pid:22218 bin/python/samba/provision/__init_=
_.py #2115: Looking up IPv6 addresses
INFO 2019-06-28 08:53:59,097 pid:22218 bin/python/samba/provision/__init_=
_.py #2288: Setting up share.ldb
INFO 2019-06-28 08:53:59,101 pid:22218 bin/python/samba/provision/__init_=
_.py #2292: Setting up secrets.ldb
INFO 2019-06-28 08:53:59,106 pid:22218 bin/python/samba/provision/__init_=
_.py #2298: Setting up the registry
INFO 2019-06-28 08:53:59,118 pid:22218 bin/python/samba/provision/__init_=
_.py #2301: Setting up the privileges database
INFO 2019-06-28 08:53:59,123 pid:22218 bin/python/samba/provision/__init_=
_.py #2304: Setting up idmap db
INFO 2019-06-28 08:53:59,127 pid:22218 bin/python/samba/provision/__init_=
_.py #2311: Setting up SAM db
INFO 2019-06-28 08:53:59,128 pid:22218 bin/python/samba/provision/__init_=
_.py #892: Setting up sam.ldb partitions and settings
INFO 2019-06-28 08:53:59,129 pid:22218 bin/python/samba/provision/__init_=
_.py #904: Setting up sam.ldb rootDSE
INFO 2019-06-28 08:53:59,131 pid:22218 bin/python/samba/provision/__init_=
_.py #1312: Pre-loading the Samba 4 and AD schema
Unable to determine the DomainSID, can not enforce uniqueness constraint =
on local domainSIDs

INFO 2019-06-28 08:53:59,153 pid:22218 bin/python/samba/provision/__init_=
_.py #2361: A Kerberos configuration suitable for Samba AD has been gener=
ated at /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/ab/tmp/FzV9azJQb0/=
tmpmpq78zlz/private/krb5.conf
INFO 2019-06-28 08:53:59,154 pid:22218 bin/python/samba/provision/__init_=
_.py #2362: Merge the contents of this file with your system krb5.conf or=
 replace it with this one. Do not create a symlink!
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom] objects[402/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom] objects[804/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom] objects[1206/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom] objects[1608/1739] linked_values[0/0]
Schema-DN[CN=3DSchema,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom] objects[1739/1739] linked_values[0/0]
Analyze and apply schema objects
Partition[CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
] objects[402/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
] objects[804/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
] objects[1206/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
] objects[1608/1622] linked_values[1/1]
Partition[CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
] objects[1622/1622] linked_values[18/18]
Partition[DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom] objects[101/96] l=
inked_values[24/24]
Partition[DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom] objects[218/218] =
linked_values[24/24]
Partition[DC=3DDomainDnsZones,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dco=
m] objects[40/40] linked_values[0/0]
Partition[DC=3DForestDnsZones,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dco=
m] objects[18/18] linked_values[0/0]
python3: WARNING: The "server schannel" option is deprecated
Repack: re-packed 10000 records so far
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
Repacking database with format 0x26011968
INFO 2019-06-28 08:54:10,078 pid:22218 bin/python/samba/join.py #1648: Se=
tting isSynchronized and dsServiceName
WARNING: The "server schannel" option is deprecated
WARNING: The "server schannel" option is deprecated
INFO 2019-06-28 08:54:11,126 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding DomainDnsZones.labdom.samba.example.com dnsRoot to CN=
=3Dd2d16fef-8020-4284-b1a0-31657d0afad2,CN=3DPartitions,CN=3DConfiguratio=
n,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,141 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing DomainDnsZones.backupdom.samba.example.com dnsRoot =
from CN=3Dd2d16fef-8020-4284-b1a0-31657d0afad2,CN=3DPartitions,CN=3DConfi=
guration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,150 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding labdom.samba.example.com dnsRoot to CN=3DBACKUPDOMAIN=
,CN=3DPartitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom
INFO 2019-06-28 08:54:11,164 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing backupdom.samba.example.com dnsRoot from CN=3DBACKU=
PDOMAIN,CN=3DPartitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom
INFO 2019-06-28 08:54:11,169 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding ForestDnsZones.labdom.samba.example.com dnsRoot to CN=
=3Da53f24fc-614d-42dc-ac85-bd873dcef75c,CN=3DPartitions,CN=3DConfiguratio=
n,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,181 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing ForestDnsZones.backupdom.samba.example.com dnsRoot =
from CN=3Da53f24fc-614d-42dc-ac85-bd873dcef75c,CN=3DPartitions,CN=3DConfi=
guration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,186 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding labdom.samba.example.com dnsRoot to CN=3DEnterprise S=
chema,CN=3DPartitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom
INFO 2019-06-28 08:54:11,199 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing backupdom.samba.example.com dnsRoot from CN=3DEnter=
prise Schema,CN=3DPartitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=
=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,203 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #710: Adding labdom.samba.example.com dnsRoot to CN=3DEnterprise C=
onfiguration,CN=3DPartitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=
=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,206 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #722: Removing backupdom.samba.example.com dnsRoot from CN=3DEnter=
prise Configuration,CN=3DPartitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Ds=
amba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,210 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #743: Changing backup domain's NetBIOS name to LABDOMAIN
INFO 2019-06-28 08:54:11,221 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #753: Renaming CN=3DBACKUPDOMAIN,CN=3DPartitions,CN=3DConfiguratio=
n,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom --> CN=3DLABDOMAIN,CN=3DPa=
rtitions,CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom
INFO 2019-06-28 08:54:11,234 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #760: Deleting old DNS zone DC=3Dbackupdom.samba.example.com,CN=3D=
MicrosoftDNS,DC=3DDomainDnsZones,DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3D=
com
INFO 2019-06-28 08:54:11,329 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #766: Deleting old DNS zone DC=3D_msdcs.backupdom.samba.example.co=
m,CN=3DMicrosoftDNS,DC=3DForestDnsZones,DC=3Dlabdom,DC=3Dsamba,DC=3Dexamp=
le,DC=3Dcom
INFO 2019-06-28 08:54:11,383 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #871: Fixing DN attributes after rename...
INFO 2019-06-28 08:54:23,999 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #187: Setting Administrator password in backup to: 8X4#9r5-dTG#_=3D=
mP
INFO 2019-06-28 08:54:24,000 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #189: Run 'samba-tool user setpassword Administrator' after restor=
ing DB
INFO 2019-06-28 08:54:24,759 pid:22218 bin/python/samba/netcmd/domain_bac=
kup.py #124: Creating backup file /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/bin/ab/tmp/FzV9azJQb0/samba-backup-labdom.samba.example.com-2019-06-2=
8T08-54-10.985342.tar.bz2...
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_setxattr() failed to get vfs_handle->data!
xattr_tdb_removexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 22246 was called with maxruntime 18000 - curr=
ent ts 1561712077
binary_smbd_main: samba: using 'prefork' process model
Attempting to autogenerate TLS self-signed keys for https for hostname 'L=
ABDC.labdom.samba.example.com'
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create /tm=
p/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 with =
mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup core=
path for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version 4.11.0p=
re1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew Tri=
dgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling turn=
ed OFF from pid 22258
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to create=
 /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0 w=
ith mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup =
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd version=
 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright Andrew=
 Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: initialize_winbi=
ndd_cache: clearing cache and re-creating with version number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready: da=
emon 'winbindd' finished starting up and ready to serve connections
TLS self-signed keys generated OK
Doing a full scan on DC=3DForestDnsZones,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Dlabdom,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom and looking for deleted objects
dnsupdate_nameupdate_done: Failed DNS update with exit code 110
=2E./../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error=
 code 110
Doing a full scan on DC=3Dlabdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and loo=
king for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Dlabdom,DC=3Dsamba,DC=3Dexamp=
le,DC=3Dcom and looking for deleted objects
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!=

/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready: daemon=
 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch reco=
rd!
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
dnsupdate_nameupdate_done: Failed DNS update with exit code 110
=2E./../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error=
 code 110
samba_parent_shutdown: samba_shutdown of samba 22246: from 22344
samba child process 22246 exited with value 0
Timed out (120 sec) waiting for dns_update_cache PID 22246 at /tmp/samba-=
testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm line 279.
Samba 22246 failed to start up at /tmp/samba-testbase/b22/samba-ad-dc-bac=
kup/selftest/target/Samba4.pm line 161.
failed to start up environment 'labdc' at /tmp/samba-testbase/b22/samba-a=
d-dc-backup/selftest/target/Samba.pm line 88.
samba can't start up known environment 'labdc' at /tmp/samba-testbase/b22=
/samba-ad-dc-backup/selftest/selftest.pl line 883.

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
[11(84)/49 at 18m56s] samba4.blackbox.ldapcmp_restore(labdc)
ERROR: Testsuite[samba4.blackbox.ldapcmp_restore(labdc)]
REASON: unable to set up environment labdc - exiting



FAILED (0 failures, 0 errors and 0 unexpected successes in 1 testsuites)

A summary with detailed information can be found in:
  ./bin/ab/summary

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl: PID[1975=
0]: Got SIGPIPE teardown environments.
teardown_env(ad_dc_backup)
samba_parent_shutdown: samba_shutdown of samba 21031: from 22345
samba child process 21031 exited with value 0
SAMBA LOG of: ADDC pid 21031
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
samba_parent_shutdown: samba_shutdown of samba 21031: from 22345
teardown_env(backupfromdc)
samba_parent_shutdown: samba_shutdown of samba 19929: from 22346
samba child process 19929 exited with value 0
SAMBA LOG of: BACKUPFROMDC pid 19929
Doing a full scan on DC=3DForestDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3DDomainDnsZones,DC=3Dbackupdom,DC=3Dsamba,DC=3De=
xample,DC=3Dcom and looking for deleted objects
Doing a full scan on CN=3DConfiguration,DC=3Dbackupdom,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom and looking for deleted objects
Doing a full scan on DC=3Dbackupdom,DC=3Dsamba,DC=3Dexample,DC=3Dcom and =
looking for deleted objects
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
dnsupdate_nameupdate_done: Failed DNS update with exit code 110
=2E./../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error=
 code 110
samba_parent_shutdown: samba_shutdown of samba 19929: from 22346
teardown_env(offlinebackupdc)
samba_parent_shutdown: samba_shutdown of samba 20069: from 22347
samba child process 20069 exited with value 0
SAMBA LOG of: OFFLINEBACKUPDC pid 20069
samba_parent_shutdown: samba_shutdown of samba 20069: from 22347
teardown_env(renamedc)
samba_parent_shutdown: samba_shutdown of samba 20323: from 22348
samba child process 20323 exited with value 0
SAMBA LOG of: RENAMEDC pid 20323
samba_parent_shutdown: samba_shutdown of samba 20323: from 22348
teardown_env(restoredc)
samba_parent_shutdown: samba_shutdown of samba 20580: from 22349
samba child process 20580 exited with value 0
SAMBA LOG of: RESTOREDC pid 20580
samba_parent_shutdown: samba_shutdown of samba 20580: from 22349
perl(19750)-+-pstree(22350)
            `-python3(19762)-+-sh(19764)---tee(19765)
                             `-{python3}(19770)
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl: PID[1975=
0]: Exiting...
dns_hub: after poll()
dns_hub: after serve_forever()
dns_hub: before exit()

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <=3D=3D
TOP 10 slowest tests
samba4.blackbox.ldapcmp_restore(labdc) -> 1561712037
samba.tests.domain_backup(ad_dc_backup:local) -> 514
samba.tests.domain_backup(restoredc:local) -> 368
samba.tests.samba_tool.gpo(restoredc:local) -> 28
samba.tests.samba_tool.gpo(offlinebackupdc:local) -> 27
samba.tests.samba_tool.gpo(renamedc:local) -> 26
samba4.blackbox.ldapcmp_restore(offlinebackupdc) -> 7
samba4.blackbox.ldapcmp_restore(restoredc) -> 4
samba.tests.ntacls_backup(restoredc:local) -> 4
samba4.blackbox.ldapcmp_restore(renamedc) -> 3
ERROR: test failed with exit code 1
Makefile:16: recipe for target 'test' failed

=3D=3D> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <=3D=3D
make: *** [test] Error 1
samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=3D1 TESTS=3D=
'--include-env=3Dbackupfromdc --include-env=3Drestoredc --include-env=3Dr=
enamedc --include-env=3Dofflinebackupdc --include-env=3Dlabdc --include-e=
nv=3Dad_dc_backup'' with status 2
waiting for tail to flush
Running: 'uname -a' in '.'
Running: 'lsb_release -a' in '.'
Running: 'free' in '.'
No LSB modules are available.
Running: 'mount' in '.'
Running: 'cat /proc/cpuinfo' in '.'
Running: 'cc --version' in '.'
Running: 'df -m .' in '.'
Running: 'df -m /tmp/samba-testbase/b22' in '.'


####################################################################

AUTOBUILD FAILURE

Your autobuild[master] on runner-72989761-project-10891704-concurrent-0 f=
ailed after 38.6 minutes
when trying to test samba-ad-dc-backup with the following error:

   samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=3D1 TEST=
S=3D'--include-env=3Dbackupfromdc --include-env=3Drestoredc --include-env=
=3Drenamedc --include-env=3Dofflinebackupdc --include-env=3Dlabdc --inclu=
de-env=3Dad_dc_backup'' with status 2

the autobuild has been abandoned. Please fix the error and resubmit.

####################################################################


samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=3D1 TESTS=3D=
'--include-env=3Dbackupfromdc --include-env=3Drestoredc --include-env=3Dr=
enamedc --include-env=3Dofflinebackupdc --include-env=3Dlabdc --include-e=
nv=3Dad_dc_backup'' with status 2
Logs in logs.tar.gz
Running after script...
$ mount
overlay on / type overlay (rw,relatime,lowerdir=3D/var/lib/docker/overlay=
2/l/VC3ETKDBG4B5FYBQJEJTP7TDZN:/var/lib/docker/overlay2/l/GYVAKK4M3LQ5YG5=
MA7AD3KPRKB:/var/lib/docker/overlay2/l/D4KO6Q3IYOPRAXQ2VC3HOD4C7I:/var/li=
b/docker/overlay2/l/5WOB3M3AG3GJHQ52UL4PXDYW4X:/var/lib/docker/overlay2/l=
/TBVHIRVPKWKM4MK36YNYVAD22U:/var/lib/docker/overlay2/l/YQZT2IAZZF7OSUMCRP=
M7EB6HVZ:/var/lib/docker/overlay2/l/TG4QSJSDFK3243FOGN3PI7V26A:/var/lib/d=
ocker/overlay2/l/WAL3FCKYKTMS2FNKARE2JT2OB5:/var/lib/docker/overlay2/l/RW=
3GHBUA2TK5WZH37GAP25Y4VE,upperdir=3D/var/lib/docker/overlay2/48d084e85c74=
221007adb1650dcd1a2d7d0fe68b73073272e7daf06532dcc94f/diff,workdir=3D/var/=
lib/docker/overlay2/48d084e85c74221007adb1650dcd1a2d7d0fe68b73073272e7daf=
06532dcc94f/work)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev type tmpfs (rw,nosuid,seclabel,size=3D65536k,mode=3D755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,seclabel,gid=3D=
5,mode=3D620,ptmxmode=3D666)
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
tmpfs on /sys/fs/cgroup type tmpfs (rw,nosuid,nodev,noexec,relatime,secla=
bel,mode=3D755)
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,rela=
time,xattr,release_agent=3D/usr/lib/systemd/systemd-cgroups-agent,name=3D=
systemd)
cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup (rw,nosuid,nodev,no=
exec,relatime,net_cls,net_prio)
cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relat=
ime,memory)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,=
relatime,cpu,cpuacct)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,rela=
time,devices)
cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relati=
me,blkio)
cgroup on /sys/fs/cgroup/pids type cgroup (rw,nosuid,nodev,noexec,relatim=
e,pids)
cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,r=
elatime,perf_event)
cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,rela=
time,hugetlb)
cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,rela=
time,freezer)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relat=
ime,cpuset)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime,seclab=
el)
/dev/sda9 on /builds type ext4 (rw,relatime,seclabel)
/dev/sda9 on /etc/resolv.conf type ext4 (rw,relatime,seclabel)
/dev/sda9 on /etc/hostname type ext4 (rw,relatime,seclabel)
/dev/sda9 on /etc/hosts type ext4 (rw,relatime,seclabel)
shm on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,seclabel,size=
=3D65536k)
/dev/sda9 on /sys/devices/virtual/dmi/id type ext4 (ro,relatime,seclabel)=

$ df -h
Filesystem      Size  Used Avail Use% Mounted on
overlay          22G  8.1G   13G  39% /
tmpfs            64M     0   64M   0% /dev
tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/sda9        22G  8.1G   13G  39% /builds
shm              64M     0   64M   0% /dev/shm
$ cat /proc/swaps
Filename				Type		Size	Used	Priority
/var/vm/swapfile1                       file		2097148	366384	-2
$ free -h
              total        used        free      shared  buff/cache   ava=
ilable
Mem:           3.6G        255M        3.1G        130M        299M      =
  3.0G
Swap:          2.0G        357M        1.7G


 =20

--------------0F298A7AB7ABA2E8B5FE44F8--

