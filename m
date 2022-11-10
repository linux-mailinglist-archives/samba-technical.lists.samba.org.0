Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E82624C64
	for <lists+samba-technical@lfdr.de>; Thu, 10 Nov 2022 22:04:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AjpWuNI2J+RudDMK1zKsjglxm/xm6T2YVquEBNPYufY=; b=UlMU8641+FZz5loQAO3IuHwF9Z
	yiXD0et00b+erd/YFcUbHXawbk9OjSCDssSdsVPKtBO8Sq5fAK4XpNM+UjthUJcSfjYDessVpC5hm
	LVTo8mN4THOP8RCyqUd+OaSVpZyfOd0fRQKsqLFD5dOBXVH9p6v7oLStSe54TT2juFYNaMxBB3I0o
	HawxrXvkCdPjupRvvd/kmZDfnQUXbM2pJfkauxGeXZC4YnPyyfnrQ4kcl2wJdOGld4adQhaFEfiuO
	A4Yz2uRD7rO4gTWc59ZzCp/ErxrA11dZMUkM5+EZpYiw+pk07hhgd+mUK3T8NGm7VspVKfS8/MOR5
	MeGUmIMA==;
Received: from ip6-localhost ([::1]:51404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1otEiF-00C4UO-Fv; Thu, 10 Nov 2022 21:03:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40465) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1otEi7-00C4UF-Q0
 for samba-technical@lists.samba.org; Thu, 10 Nov 2022 21:03:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id p21so2568507plr.7
 for <samba-technical@lists.samba.org>; Thu, 10 Nov 2022 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PRQf+vIGQoJjzGdIxmegNnZBr2RNj7M/U2D3p80CSLs=;
 b=BAfIp/Tf4L9Qe9kqFXfzziHBdgkIf0IhOVTVvrNj6VAQqW8dtB2O08ne47B13J0F6P
 KXBBl2vta1eT9x5qJLsIeqeZLTKbtVrmkqGcARWB9AekzzNj7Z/IwloxEf+URk4wbZLt
 Rj5ifQ5A+kMGoa4kccnc8zMoNMBWkI0tXYe02JZmj6nYvND5R9z2UycZYqfQhTmKAE+7
 LPUN04duDqzwLpGqq8Npp5Flm5v9agvn11gB0pnROaWsocPYGASVYFRDdWchoWMTucHk
 fJ+kcs1lpMfOWUmdkJ0YQOXxvlRdU8sdtQgQlJHAF6aemav46gGlBJedsEFZD94QhZym
 cHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRQf+vIGQoJjzGdIxmegNnZBr2RNj7M/U2D3p80CSLs=;
 b=j78cYAsjRngdUDkOI0rkzXCxtA9i9Ucd1SLtFGT/AeZ5gpMppG88VgN0lEXR6kRF/Y
 TNbqiO5XOaQByOGkRT7Xa1/YaRRj/hEIkT84uJmJ0XICoKrWc+E66G2qPnAz9+L4ZdxS
 zYAidDORQ8GYdHk4yDGhChavD5hD88X3Cu/B+8KvbqrHtwt4nOO+m2vE9v1WIYxo38dE
 Sllv+rLjq5Cix/yIVSmW4sJ7iiKVZphxM7rJhbHRLMq3ZPQILhQs43hBdfCsOcWHk5pW
 OeeVRYYQb6nGPFfTq8AujY3fSwNdknztRevDEq+3cCgS3CtnCFJmIQlI2erO5iGQFmvN
 dvzA==
X-Gm-Message-State: ACrzQf1ZCZpT5leHe9C/l+JUxkAeDEhhqDmJB1Gay4lTAi2GzDbxv5NN
 BJ7KVyW008GnEU2U+nLnBYbmdyB/iyFijisaQFMkfMZkp4MKMVty
X-Google-Smtp-Source: AMsMyM5TW9+eSxNtwXgIxwl+WKyah0XvHt++hKm9lk57cg4B0sa2Ui2hNWsmr7b5VR7kQ8eUJZI4NQC+SUPwyU66WPA=
X-Received: by 2002:a17:903:1355:b0:188:4ba9:79ee with SMTP id
 jl21-20020a170903135500b001884ba979eemr1854323plb.83.1668114219884; Thu, 10
 Nov 2022 13:03:39 -0800 (PST)
MIME-Version: 1.0
References: <CAB5c7xqc7BfQ3dCA=Le9izqxzC=bzAWZpYzE4tFUv1N-_Ocfmw@mail.gmail.com>
 <Y21joyg1L6gJ9WAo@jeremy-acer>
In-Reply-To: <Y21joyg1L6gJ9WAo@jeremy-acer>
Date: Thu, 10 Nov 2022 16:03:28 -0500
Message-ID: <CAB5c7xpxXEHH4y1uhq1egPgt9NxNH2Nv9XYR2Lq1=igBoqYgnA@mail.gmail.com>
Subject: Re: FSCTL_READ_FILE_USN_DATA on "SmartScreen" alternate data stream
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Can you give the entire call stack. Might be easier to just change the
upper level code to pass on metadata_fsp(fsp) instead.

Yeah, that's not a problem. I'll also attach my WIP torture test at bottom
of this email to save you perhaps a little effort. Let me know if
formatting gets blown up and I'll email git diff. Torture test against
windows server succeeds BTW (STATUS_OK).

Here's linux core:
```
(gdb) bt
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007f68dcd94537 in __GI_abort () at abort.c:79
#2  0x00007f68dd281960 in dump_core () at ../../source3/lib/dumpcore.c:338
#3  0x00007f68dd28ef01 in smb_panic_s3 (why=<optimized out>) at
../../source3/lib/util.c:713
#4  0x00007f68dcfa78ea in smb_panic (why=why@entry=0x7f68dd4b78c0 "assert
failed: !fsp_is_alternate_stream(fsp)") at ../../lib/util/fault.c:198
#5  0x00007f68dd3c173e in vfswrap_fsctl (handle=0x558c37ccb510,
fsp=0x558c37d33c60, ctx=0x558c37d2eb40, function=590016,
req_flags=<optimized out>, _in_data=0x0, in_len=0,
_out_data=0x7fff0dc5aab0,
    max_out_len=64, out_len=0x7fff0dc5aaa0) at
../../source3/modules/vfs_default.c:1497
#6  0x00007f68dd439789 in smb2_ioctl_filesys (ctl_code=ctl_code@entry=590016,
ev=ev@entry=0x558c37cb3340, req=req@entry=0x558c37d2e980,
state=0x558c37d2eb40)
    at ../../source3/smbd/smb2_ioctl_filesys.c:788
#7  0x00007f68dd4388c3 in smbd_smb2_ioctl_send (in_flags=1,
in_max_output=<optimized out>, in_input=..., in_ctl_code=<optimized out>,
fsp=0x558c37d33c60, smb2req=0x558c37cb0400, ev=0x558c37cb3340,
    mem_ctx=0x558c37cb0400) at ../../source3/smbd/smb2_ioctl.c:465
#8  smbd_smb2_request_process_ioctl (req=req@entry=0x558c37cb0400) at
../../source3/smbd/smb2_ioctl.c:224
#9  0x00007f68dd428172 in smbd_smb2_request_dispatch
(req=req@entry=0x558c37cb0400)
at ../../source3/smbd/smb2_server.c:3435
#10 0x00007f68dd429227 in smbd_smb2_io_handler (fde_flags=<optimized out>,
xconn=0x558c37cdd8e0) at ../../source3/smbd/smb2_server.c:5008
#11 smbd_smb2_connection_handler (ev=<optimized out>, fde=<optimized out>,
flags=<optimized out>, private_data=<optimized out>) at
../../source3/smbd/smb2_server.c:5046
#12 0x00007f68dd1c24f1 in tevent_common_invoke_fd_handler
(fde=fde@entry=0x558c37cdc820,
flags=1, removed=removed@entry=0x0) at ../../lib/tevent/tevent_fd.c:142
#13 0x00007f68dd1c8ae7 in epoll_event_loop (tvalp=0x7fff0dc5ad80,
epoll_ev=0x558c37cdbf70) at ../../lib/tevent/tevent_epoll.c:737
#14 epoll_event_loop_once (ev=<optimized out>, location=<optimized out>) at
../../lib/tevent/tevent_epoll.c:938
#15 0x00007f68dd1c6c27 in std_event_loop_once (ev=0x558c37cb3340,
location=0x7f68dd4d9d10 "../../source3/smbd/smb2_process.c:2015") at
../../lib/tevent/tevent_standard.c:114
#16 0x00007f68dd1c18a4 in _tevent_loop_once (ev=ev@entry=0x558c37cb3340,
location=location@entry=0x7f68dd4d9d10
"../../source3/smbd/smb2_process.c:2015") at ../../lib/tevent/tevent.c:828
#17 0x00007f68dd1c1b8b in tevent_common_loop_wait (ev=0x558c37cb3340,
location=0x7f68dd4d9d10 "../../source3/smbd/smb2_process.c:2015") at
../../lib/tevent/tevent.c:951
#18 0x00007f68dd1c6bc7 in std_event_loop_wait (ev=0x558c37cb3340,
location=0x7f68dd4d9d10 "../../source3/smbd/smb2_process.c:2015") at
../../lib/tevent/tevent_standard.c:145
#19 0x00007f68dd416380 in smbd_process (ev_ctx=ev_ctx@entry=0x558c37cb3340,
msg_ctx=msg_ctx@entry=0x558c37ccf9b0, sock_fd=sock_fd@entry=34,
interactive=interactive@entry=false)
    at ../../source3/smbd/smb2_process.c:2015
#20 0x0000558c365f0061 in smbd_accept_connection (ev=0x558c37cb3340,
fde=<optimized out>, flags=<optimized out>, private_data=<optimized out>)
at ../../source3/smbd/server.c:1037
#21 0x00007f68dd1c24f1 in tevent_common_invoke_fd_handler
(fde=fde@entry=0x558c37cc2600,
flags=1, removed=removed@entry=0x0) at ../../lib/tevent/tevent_fd.c:142
#22 0x00007f68dd1c8ae7 in epoll_event_loop (tvalp=0x7fff0dc5b010,
epoll_ev=0x558c37cd04a0) at ../../lib/tevent/tevent_epoll.c:737
#23 epoll_event_loop_once (ev=<optimized out>, location=<optimized out>) at
../../lib/tevent/tevent_epoll.c:938
#24 0x00007f68dd1c6c27 in std_event_loop_once (ev=0x558c37cb3340,
location=0x558c365f2eb0 "../../source3/smbd/server.c:1381") at
../../lib/tevent/tevent_standard.c:114
#25 0x00007f68dd1c18a4 in _tevent_loop_once (ev=ev@entry=0x558c37cb3340,
location=location@entry=0x558c365f2eb0 "../../source3/smbd/server.c:1381")
at ../../lib/tevent/tevent.c:828
#26 0x00007f68dd1c1b8b in tevent_common_loop_wait (ev=0x558c37cb3340,
location=0x558c365f2eb0 "../../source3/smbd/server.c:1381") at
../../lib/tevent/tevent.c:951
#27 0x00007f68dd1c6bc7 in std_event_loop_wait (ev=0x558c37cb3340,
location=0x558c365f2eb0 "../../source3/smbd/server.c:1381") at
../../lib/tevent/tevent_standard.c:145
#28 0x0000558c365ed219 in smbd_parent_loop (parent=0x558c37cacde0,
ev_ctx=0x558c37cb3340) at ../../source3/smbd/server.c:1381
#29 main (argc=<optimized out>, argv=<optimized out>) at
../../source3/smbd/server.c:2125
```

Torture test:
```
static NTSTATUS test_ioctl_stream(struct torture_context *torture,
      TALLOC_CTX *mem_ctx,
      struct smb2_tree *tree,
      struct smb2_handle fh)
{
union smb_ioctl ioctl;
NTSTATUS status;
struct file_zero_data_info zdata_info;
TALLOC_CTX *tmp_ctx = talloc_new(mem_ctx);
if (tmp_ctx == NULL) {
return NT_STATUS_NO_MEMORY;
}

ZERO_STRUCT(ioctl);
ioctl.smb2.level = RAW_IOCTL_SMB2;
ioctl.smb2.in.file.handle = fh;
ioctl.smb2.in.function = FSCTL_CREATE_OR_GET_OBJECT_ID,
ioctl.smb2.in.max_output_response = 64;
ioctl.smb2.in.flags = SMB2_IOCTL_FLAG_IS_FSCTL;

status = smb2_ioctl(tree, tmp_ctx, &ioctl.smb2);
if (!NT_STATUS_IS_OK(status)) {
goto err_out;
}

status = NT_STATUS_OK;
err_out:
talloc_free(tmp_ctx);
return status;
}

bool test_ioctl_alternate_data_stream(struct torture_context *tctx)
{
bool ret = true;
int offset, beyond_final_zero;
const char *fname = DNAME "\\test_stream_ioctl_dir";
const char *sname = DNAME "\\test_stream_ioctl_dir:stream";
NTSTATUS status;
struct smb2_create create = { };
struct smb2_tree *tree = NULL;
struct smb2_handle h1 = {{0}};
const char *data = "test data";

if (!torture_smb2_connection(tctx, &tree)) {
torture_comment(tctx, "Initializing smb2 connection failed.\n");
return false;
}

smb2_deltree(tree, DNAME);

status = torture_smb2_testdir(tree, DNAME, &h1);
torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
"torture_smb2_testdir failed\n");

smb2_util_close(tree, h1);
create = (struct smb2_create) {
.in.desired_access = SEC_FILE_ALL,
.in.share_access = NTCREATEX_SHARE_ACCESS_MASK,
.in.file_attributes = FILE_ATTRIBUTE_HIDDEN,
.in.create_disposition = NTCREATEX_DISP_CREATE,
.in.impersonation_level = SMB2_IMPERSONATION_IMPERSONATION,
.in.fname = fname,
};

status = smb2_create(tree, tctx, &create);
torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
"smb2_create failed\n");

h1 = create.out.file.handle;
status = smb2_util_close(tree, h1);

create = (struct smb2_create) {
.in.desired_access = SEC_FILE_ALL,
.in.share_access = NTCREATEX_SHARE_ACCESS_MASK,
.in.file_attributes = FILE_ATTRIBUTE_NORMAL,
.in.create_disposition = NTCREATEX_DISP_CREATE,
.in.impersonation_level = SMB2_IMPERSONATION_IMPERSONATION,
.in.fname = sname,
};
status = smb2_create(tree, tctx, &create);
torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
"smb2_create failed\n");
        h1 = create.out.file.handle;

status = test_ioctl_stream(tctx, tctx, tree, h1);
if (!NT_STATUS_IS_OK(status)) {
smb2_util_close(tree, h1);
torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
"test_ioctl_stream failed\n");
}
done:
return ret;
}
```
