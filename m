Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8E7F6EBC
	for <lists+samba-technical@lfdr.de>; Fri, 24 Nov 2023 09:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=fF93t324ZSm3dyUUIobJ9eNJiNUf1hTOLHXXNRZYIFc=; b=VmAdHv4jr6wGENAsapO9Wbv2aE
	0D6puvtsBl2F6Ayvt46RlmM6t1mznxFLoSqLxAS/3z67t/uncCO0QexqkUoSbParOgWzA9s/peT+y
	UPKcvx7rlxkIrWFxRZNhl+HQ7MAWnBq3AU4U59Ch15xhPT2666AC+ehoWpNJ3eY5sWWmQM1+zWh6D
	VZIpczeJogBThBhhqGHLCV225N+5Q7Z9QfFJVF7ucKs6tJsbr3rAqgyizdKbzgfAeMeBFZWUjdFh0
	YzKA75SwpuR8eCOE64iqAAj5ztEN24iKKVAAxFzZoKQFLx/ZF4piQkWH1vhx4cC6IMLCqSUOtALOS
	RDuSiuVw==;
Received: from ip6-localhost ([::1]:31500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r6Ro3-000PVj-4R; Fri, 24 Nov 2023 08:44:59 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:52522) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r6Rnz-000PVa-6L
 for samba-technical@lists.samba.org; Fri, 24 Nov 2023 08:44:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507bd64814fso2302833e87.1
 for <samba-technical@lists.samba.org>; Fri, 24 Nov 2023 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700815493; x=1701420293; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Vby4U07YiTdIl/fJoOU0CfPK/WnWEXzDmEV4JXc0EzM=;
 b=UJSL9Sis8FwcXtdh1zeySDiOiX+s1LH0qPDaMpiySFxdZNRuQLNAcY2b+9E+shGjFc
 RNEaJQCdEcgL7QLIWno05Yax50CJd3hXg7M+UB/jg2zAfSe3rvG8mRe2bt5llMArahc9
 6gCv3Ql22c/wptC0vHmKC+Py8bdlRrJlsev4QpZ9A3ys3D+7ndJ0fN4+5WpVkJnVfl1q
 YUTqypJfmTgdvXhZ9Vkk5J5+qcLVsJPJJTvt0FcO/lVwvSo7EBKdjZf0L1wg6E0gb664
 joMhrfXC8HiF+sY5No7bHQlCdko3T62i9cBChVxsMWtvTWvm0N9syPic5QNhy3RQnOtk
 BfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815493; x=1701420293;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vby4U07YiTdIl/fJoOU0CfPK/WnWEXzDmEV4JXc0EzM=;
 b=tcwrQKknKkRWriaqCF6fLlxFuORFeDEaZORxrnCzFjmcegRBO6mebMLtXDdijdb0X0
 0COlyIvAaL93G9kTCVrQIX3oFeu5hpTqy7iJHnxP3TcU7GiLas0EFMXJQ5VdnUyAmMZ3
 Z65iMPMbtKQAK4QAcZra/Z/KsDYZDk0nSm2uafIhvl0EGm9LZ6HKpsXNobuerSW1pk3R
 rZ1d1nFZJ1tstq4272YGP4y9cyKiFh7tQmlWhsSPRzsnb95jg6+kLZp4fzORFSXTybYD
 lfeh3/s/rE2qi2EvfXr0EajUY75rt6Yq6iLRa0UDtIk+By+q5VvgqQuwAlTay/MiIdOZ
 4/8g==
X-Gm-Message-State: AOJu0YySjSPg0GpktfvQWssbQLvqhbpPbj/LYI1Rlv9qU1E/FCFAz1tc
 y8aWGjZJX0cWxHWyTzcZvPb7/euPO5aNN33pW3fwQ+keuMc=
X-Google-Smtp-Source: AGHT+IG5K8V3kFGE4FPmD3FwIMISUIrxbblfSP0tyPa2UQVLt7VzqNd7PGv245C+aY0smfhwtN5k0Ok5AJUyMeTTcqY=
X-Received: by 2002:a05:6512:508:b0:50a:a2cb:cd72 with SMTP id
 o8-20020a056512050800b0050aa2cbcd72mr1088702lfb.68.1700815493275; Fri, 24 Nov
 2023 00:44:53 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 24 Nov 2023 16:44:42 +0800
Message-ID: <CAH_an_8Z9VGMb2+WhgFuiX9F-GmxRUkGzp=e-pcpbic947Qwbw@mail.gmail.com>
Subject: SEC_STD_DELETE not granted in smb2.maximum_allowed in smbtorture
To: samba-technical@lists.samba.org
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
From: vvghnnjk via samba-technical <samba-technical@lists.samba.org>
Reply-To: vvghnnjk <vvghnnjk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, recently I have been using smbtorture as a testing tool to test my
Samba server and have encountered a failure in smb2.maximum_allowed
testcase. Upon inspecting the log, it was identified that SEC_STD_DELETE
access mask is getting denied:

se_access_check: MAX desired = 0x2010000, granted = 0x170089, remaining =
0x170089
smbd_calculate_maximum_allowed_access_fsp: Status NT_STATUS_ACCESS_DENIED
on file torture_maximum_allowed: when calculating maximum access
open_file_ntcreate: smbd_calculate_access_mask_fsp on file
torture_maximum_allowed returned NT_STATUS_ACCESS_DENIED
create_file_unixpath: NT_STATUS_ACCESS_DENIED
streams_xattr_close: streams_xattr_close called [torture_maximum_allowed]
fd [30]

While it should be NT_STATUS_OK in source4/torture/smb2/max_allowed.c:
 for (i = 0; i < 32; i++) {
uint32_t mask = SEC_FLAG_MAXIMUM_ALLOWED | (1u << i);
/*
* SEC_GENERIC_EXECUTE is a complete subset of
* SEC_GENERIC_READ when mapped to specific bits,
* so we need to include it in the basic OK mask.
*/
uint32_t ok_mask = SEC_RIGHTS_FILE_READ | SEC_GENERIC_READ |
SEC_GENERIC_EXECUTE | SEC_STD_DELETE | SEC_STD_WRITE_DAC;


Here is my settings:
Samba server version: 4.18.8
smbtorture version: 4.15.13-Ubuntu
storage backend: CephFS kernel mount
OS: Ubuntu22.04 / linux 5.15.0-88-generic

Here is my smb.conf:
[global]
disable spoolss = yes
dos charset = ascii
fileid:algorithm = fsid
load printers = no
printcap name = /dev/null
printing = bsd
smb ports = 445
vfs objects = fileid acl_xattr streams_xattr
hide files = /hidefile/
smbd:FSCTL_SMBTORTURE = yes
strict rename = no
netbios name = smbserver

[smbshare1]
browseable = yes
path = /mnt/smbserver/smbshare1
read only = no

I am wondering if the failure is caused by smbtorture or my config settings
or others. Thanks for any advice!
