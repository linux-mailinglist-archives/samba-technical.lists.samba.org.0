Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA39EB7E
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 16:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7PoTAbhcENlogYHR/zBt4yPAdDdR0K6fBEazKNVJj0Q=; b=MHxJ4DZkx8jtPNe/yvVPSduj4k
	aibivEZG/uWimIFOadjZAduvFanS0gZixDmRXHMN3cdI31S7vlnPTBHYy5C1GisRbLHtRcMInbuHX
	UXkzCUarkOdOE21SBkDYAU78W2dYxaX0+ydeFLu5JmIRnUZJZwEwaYDDG41gPtGouEBN1/67K/qx3
	cT5n75QP5pwAwRtuiamoIz9lKifn4LkrWUdwGxHOQpbb6How0zFHSCwnqCH2QETGH8R/Z6a6a3WA8
	e+dQPVGZg4fryPHE6uI/3Khik3mznWwia+SJRet6Qt3nBMEBLNZaGYDHUOrvLOz5qXPQ8lHicQI+I
	4Bq7QOAg==;
Received: from localhost ([::1]:59740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2cmw-008kB3-Bq; Tue, 27 Aug 2019 14:49:38 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35200) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2cmq-008kAw-Pf
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 14:49:35 +0000
Received: by mail-yb1-xb33.google.com with SMTP id c9so8325038ybf.2
 for <samba-technical@lists.samba.org>; Tue, 27 Aug 2019 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=16X8xJEuExkoFGNk/l87mELAXO4/zB0Uf79WbEqeRCE=;
 b=Pt061oI0ysOJs50hKtqGJKnRZxhKsPW8DeuK27LJiRkvZNrXz/UyMkDgqJT1SHrKpS
 c1kHyrV7QhNuIYz82fZupucHBIxu0dm5iQxjm1IAU8kcmlv/hjomWBPKNoPBg6EuEK4Z
 JtntdsVFptcxxUMo9uNyqUzKRVH7RQIEx7yth2BHjGo+mMQvDYrTmevY79DyAaCse/HE
 WcAzNoHuD9rMrt122N4ARhxuFAc55ScCem/tYIDqV9qQEaj5qnVu8E8y2EWbqc0H9b46
 eJNSXlQEIXf/TOpkSOSO9vRB4Qk3C+X1Ivyvj8waoT5ZdWaiG9DUwVdi4zeKKXnDINmx
 +e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=16X8xJEuExkoFGNk/l87mELAXO4/zB0Uf79WbEqeRCE=;
 b=CPXXDGBOhOVtnwqG3uHW5WMWtyzLro/2bmJibjB/KCtzq2LYEYWk3pVkDIFM6ORfyW
 bcQmOeQ6bzllgaNyRVIoVaAsB0TfK98/AsZipPNH/lkbknQJS3445Anwv4NZbiNIzUTy
 PgjL2la7gLp9S5hzXRH28Khn4NWUVJa9I9GrVJSw0YoQzhPdrJToecPYJv5L6GfhtCMr
 ib9UVkBXMgeXGU7QIidQ/CcFo5oOevyvdCZaArP6cWMN+gV/dpYsiWb3ZWzyNpZLicCp
 Ki3gjq3zmt0dXFH6TryLFgfl/Tlut8M1xhyQoJMoYxak+/CpRc0lR/lJVuEyFPALERX/
 elGQ==
X-Gm-Message-State: APjAAAXQ7jLjJ0Xi0/0D4eMIWv8Zm/m8kSWB9Gh9hy7QmY4uZddD4z1R
 ypZdEcGRmngP1COoK6nkrrnaWQoNMy+N1U1cfzaqkS9kaCresA==
X-Google-Smtp-Source: APXvYqxOs8hI3bjvx/qbpUsn3LF5JoSjNfBx3AUU5oJ0b8yXUU2zU/1G/wnSt9bwUwTUq9YeaKEoJHR//cg0YDI/Uv0=
X-Received: by 2002:a25:9bc7:: with SMTP id w7mr18016940ybo.137.1566917370924; 
 Tue, 27 Aug 2019 07:49:30 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Aug 2019 10:49:19 -0400
Message-ID: <CAB5c7xqToOayxaAp9TYexiz-vKFbx-tUnbNqfgNGbE7EYMQ+eg@mail.gmail.com>
Subject: Add option to sort dacl into canonical order in nfs4_acls
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="00000000000049913a05911a6195"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000049913a05911a6195
Content-Type: text/plain; charset="UTF-8"

There are many ways that applications can write NFS4 ACL entries in a
non-canonical order per MS-DTYP 2.4.5. It would be nice to have the option
to automatically sort these into canonical order so that Windows doesn't
complain when viewing these.  I'm honestly a bit torn regarding the best
path forward with this. It's easy to say "you're doing it wrong - fix your
ACLs", but I imagine that some admins would want a "stop nagging me" option.

Example of some operations resulting out-of-order ACEs:
# file: /mnt/dozer/share/inherited
# owner: root
# group: smbuser
      user:smbuser:rwxpDdaARWcCos:-------:allow
            owner@:rwxpDdaARWcCos:fd----I:allow
            group@:rwxpDdaARWcCos:fd----I:allow
         everyone@:--------------:fd----I:allow
root@freenas[/mnt/dozer]# setfacl -m u:root:full_set:fd:allow
/mnt/dozer/share/inherited
root@freenas[/mnt/dozer]# getfacl /mnt/dozer/share/inherited

# file: /mnt/dozer/share/inherited
# owner: root
# group: smbuser
         user:root:rwxpDdaARWcCos:fd-----:allow
      user:smbuser:rwxpDdaARWcCos:-------:allow
            owner@:rwxpDdaARWcCos:fd----I:allow
            group@:rwxpDdaARWcCos:fd----I:allow
         everyone@:--------------:fd----I:allow
root@freenas[/mnt/dozer]# chmod 777 /mnt/dozer/share/inherited
root@freenas[/mnt/dozer]# getfacl /mnt/dozer/share/inherited
# file: /mnt/dozer/share/inherited
# owner: root
# group: smbuser
         user:root:rwxpDdaARWcCos:fd-----:allow
      user:smbuser:rwxpDdaARWcCos:-------:allow
            owner@:rwxpDdaARWcCos:fdi---I:allow
            group@:rwxpDdaARWcCos:fdi---I:allow
         everyone@:--------------:fdi---I:allow
            owner@:rwxp--aARWcCos:-------:allow
            group@:rwxp--a-R-c--s:-------:allow
         everyone@:rwxp--a-R-c--s:-------:allow

--00000000000049913a05911a6195
Content-Type: text/x-patch; charset="US-ASCII"; name="add_sort_aces.patch"
Content-Disposition: attachment; filename="add_sort_aces.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jztxq9sw0>
X-Attachment-Id: f_jztxq9sw0

ZGlmZiAtLWdpdCBhL3NvdXJjZTMvbW9kdWxlcy9uZnM0X2FjbHMuYyBiL3NvdXJjZTMvbW9kdWxl
cy9uZnM0X2FjbHMuYwppbmRleCA0ZDUwMjIzLi42MDExYTcyIDEwMDY0NAotLS0gYS9zb3VyY2Uz
L21vZHVsZXMvbmZzNF9hY2xzLmMKKysrIGIvc291cmNlMy9tb2R1bGVzL25mczRfYWNscy5jCkBA
IC0xMDcsNiArMTA3LDEwIEBAIGludCBzbWJhY2w0X2dldF92ZnNfcGFyYW1zKHN0cnVjdCBjb25u
ZWN0aW9uX3N0cnVjdCAqY29ubiwKIAogCXBhcmFtcy0+bWFwX2Z1bGxfY29udHJvbCA9IGxwX2Fj
bF9tYXBfZnVsbF9jb250cm9sKFNOVU0oY29ubikpOwogCisJcGFyYW1zLT5zb3J0X2RhY2wgPSBs
cF9wYXJtX2Jvb2woU05VTShjb25uKSwKKwkJCQkJIFNNQkFDTDRfUEFSQU1fVFlQRV9OQU1FLAor
CQkJCQkgInNvcnRfZGFjbCIsIEZhbHNlKTsKKwogCURFQlVHKDEwLCAoIm1vZGU6JXMsIGRvX2No
b3duOiVzLCBhY2VkdXA6ICVzIG1hcCBmdWxsIGNvbnRyb2w6JXNcbiIsCiAJCWVudW1fc21iYWNs
NF9tb2Rlc1twYXJhbXMtPm1vZGVdLm5hbWUsCiAJCXBhcmFtcy0+ZG9fY2hvd24gPyAidHJ1ZSIg
OiAiZmFsc2UiLApAQCAtNTMyLDYgKzUzNiwxMSBAQCBzdGF0aWMgTlRTVEFUVVMgc21iX2dldF9u
dF9hY2xfbmZzNF9jb21tb24oY29uc3QgU01CX1NUUlVDVF9TVEFUICpzYnVmLAogCQlyZXR1cm4g
TlRfU1RBVFVTX05PX01FTU9SWTsKIAl9CiAKKwlpZiAoKCpwcGRlc2MpLT5kYWNsICYmIHBhcmFt
cy0+c29ydF9kYWNsKSB7CisJCWRhY2xfc29ydF9pbnRvX2Nhbm9uaWNhbF9vcmRlcigoKnBwZGVz
YyktPmRhY2wtPmFjZXMsCisJCQkJCSAgICAgICAodW5zaWduZWQgaW50KSgqcHBkZXNjKS0+ZGFj
bC0+bnVtX2FjZXMpOworCX0KKwogCURFQlVHKDEwLCAoInNtYl9nZXRfbnRfYWNsX25mczRfY29t
bW9uIHN1Y2Nlc3NmdWxseSBleGl0ZWQgd2l0aCAiCiAJCSAgICJzZF9zaXplICVkXG4iLAogCQkg
ICAoaW50KW5kcl9zaXplX3NlY3VyaXR5X2Rlc2NyaXB0b3IoKnBwZGVzYywgMCkpKTsKZGlmZiAt
LWdpdCBhL3NvdXJjZTMvbW9kdWxlcy9uZnM0X2FjbHMuaCBiL3NvdXJjZTMvbW9kdWxlcy9uZnM0
X2FjbHMuaAppbmRleCBjOWZjZjZkLi5hZDk4MWEzIDEwMDY0NAotLS0gYS9zb3VyY2UzL21vZHVs
ZXMvbmZzNF9hY2xzLmgKKysrIGIvc291cmNlMy9tb2R1bGVzL25mczRfYWNscy5oCkBAIC0xMTMs
NiArMTEzLDcgQEAgc3RydWN0IHNtYmFjbDRfdmZzX3BhcmFtcyB7CiAJYm9vbCBkb19jaG93bjsK
IAllbnVtIHNtYmFjbDRfYWNlZHVwX2VudW0gYWNlZHVwOwogCWJvb2wgbWFwX2Z1bGxfY29udHJv
bDsKKwlib29sIHNvcnRfZGFjbDsKIH07CiAKIGludCBzbWJhY2w0X2dldF92ZnNfcGFyYW1zKHN0
cnVjdCBjb25uZWN0aW9uX3N0cnVjdCAqY29ubiwK
--00000000000049913a05911a6195--

