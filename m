Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281B90906F
	for <lists+samba-technical@lfdr.de>; Fri, 14 Jun 2024 18:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pWClqSzIrhX0zaI0Q5xWiBUPgaQmPqtQWLE+OG81fS0=; b=XlPTIBWbnLir0DtKJRlkAV1Z4y
	9c0V9ojIsgVw7Uk58CSt/Tm4ZArC7PmcClTmhBPfPtLMCsKcMkiRZbFFja6NWG5ROE5Q23tPiygBY
	k6NKK2dA21wAYnxC/tnKobivgY1dPYUyI7VseytZ32kNpyXJx/FzRVGChUcGPTdmrB6YEoKEKKEQx
	JK7XjexoehgiIJzm2Da7SK1BOB79akTPtB0EWalMwaXLxZiwZWCo+0+7RhSSUqFa8gNC+wOHqs3tu
	ig999hNmjBTH5EpUz8Cbix2WysmyFpm00w9eQPDOfS0YmLolngyQWmeMgkiyED6lWnecGhEopK9A2
	Y52XT1Tw==;
Received: from ip6-localhost ([::1]:65382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sI9tZ-00DqCs-EB; Fri, 14 Jun 2024 16:35:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57231) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sI9tU-00DqCi-D8
 for samba-technical@lists.samba.org; Fri, 14 Jun 2024 16:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718382912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pWClqSzIrhX0zaI0Q5xWiBUPgaQmPqtQWLE+OG81fS0=;
 b=G0JvWezhpWBukk+WdekbQBSBLU4uTjyIVwF2BvRrlsPixNvCGmDOZBzhTHbhSR1o3qO6VR
 ciM7dLxwvJXg9xBfnAXsnlMH18k/yNQ+1+uODTTnAKbLeswg9rdx3Osp0wY8zPtYj3gnVa
 /ei/cb6Qh2793188EU0I7chNPtM1Fcg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718382913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pWClqSzIrhX0zaI0Q5xWiBUPgaQmPqtQWLE+OG81fS0=;
 b=Y6KSIOk8kJw9WT5zMalz3k0gzWwPNjr2T4s8CEpJonybniY5X3agBemDYGEWUO39EBivUC
 /05M3y3Rpz/ZzGLzv/zx4nEMexh/UK03gGlxyPI1BVO4GOhZVj+IedPmPVUYPUGKBEGhaD
 1NOGh+WOhUPFBUheXWrrTG8tD01hB80=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-RI3Nfy0XO3aDTTrDglswSw-1; Fri, 14 Jun 2024 12:19:13 -0400
X-MC-Unique: RI3Nfy0XO3aDTTrDglswSw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52c7cff3b89so1832296e87.0
 for <samba-technical@lists.samba.org>; Fri, 14 Jun 2024 09:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718381951; x=1718986751;
 h=mime-version:user-agent:content-transfer-encoding:date:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWClqSzIrhX0zaI0Q5xWiBUPgaQmPqtQWLE+OG81fS0=;
 b=B0rMtuoBIiyWWbG0TyEbi7kPVY+zPK7dC/RtPgC4qSju2nPaLRjukDQ2/5zidJt4Dk
 9kuoY0FuaOFkwpZt0ifnB4CF8uxp+15axLaJPcQZLuKYCW/5yLAYeC+3u93eo4bfeBDs
 ZPA9JtQYomkYuzZ/CFiU1NEtiyqE5J5FT3MElIk7JTdsn/NxDK0/5D8D76WFNwqJxLSf
 KhyaIstCk/E4dgVVrcSCYWSen1HGFtKq3eX1ihFinnMQGDLrTxrkCDPs5KwSTjGTyZog
 UVYWjId4ybjTL1dOJwXrMijWqEON0KzXlevwjlKQy9BZG4EkASSRWrSDrlJCmT6HajIJ
 Yf9Q==
X-Gm-Message-State: AOJu0Ywd1j0lq4gR4hL8utgJAisGsOV8n2eUmDc3owddUH5j+xL7O1eP
 HtbHqybRveG2BLB2uwr9Dk34+3UJsXvwYlq2lVLU9iHG3qYWDD74szInjG7jx2hlGbq0JSniKmt
 XV4seYOf37rIQaENfBa5H61fI+rfDGM8j/lCqxPRwqmzO5dNjAomuYW4hXM3SymBEGy5+FYdA41
 7vTG0nuhacJ38jOQK01CjC6+ZKvekgsNPWudL/Nd7PJlS2IVl+
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id
 2adb3069b0e04-52ca6e999e7mr1784827e87.67.1718381951295; 
 Fri, 14 Jun 2024 09:19:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYEgUJlcZ3kSjCnYrKr9hsvrTAlrd/9caiwms7bZyN3l5CMqrKDmR02jj8WBFd4v9kj1JECw==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id
 2adb3069b0e04-52ca6e999e7mr1784804e87.67.1718381950579; 
 Fri, 14 Jun 2024 09:19:10 -0700 (PDT)
Received: from splp2.home.spui.uk ([2a01:4b00:b705:d600:8ff1:d9a5:3bb5:3502])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6127c6fsm67734445e9.24.2024.06.14.09.19.09
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:19:10 -0700 (PDT)
Message-ID: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
Subject: smb2.session.reauth4: UID/GID to use as anonymous user when
 modifying DACL
To: samba-technical@lists.samba.org
Date: Fri, 14 Jun 2024 17:19:09 +0100
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
From: Sachin Prabhu via samba-technical <samba-technical@lists.samba.org>
Reply-To: sprabhu@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Team,=20

I have been testing the latest vfs_ceph2(experimental) module in the
process of being written by Shachar Sharon.
I hit a failure in the test=20
smb2.session.reauth4

failure: samba3.smb2.session.reauth4 [
Exception: ../../source4/torture/smb2/session.c:603: status was
NT_STATUS_ACCESS_DENIED, expected NT_STATUS_OK: smb2_setinfo_file
failed

]

From what I understand, the test does the following
test_session_reauth4()
- SESSION setup with test user
- CREATE file
- GETINFO SEC_INFO on the file - get owner, group and dacl
- Reauthticate as anonymous - SESSION setup with anonymous user
- SETINFO on file - We copy the DACL from the earlier GETINFO and add
additional access for anonymous user.
- Reauthenticate as original user - SESSION setup with test user.
- GETINFO on the same file

The failure happend when we attempt the SETINFO as anonymous user and
an ACCESS_DENIED error is returned at
https://gitlab.com/synarete/samba/-/blob/vfs_ceph_ll/source3/modules/vfs_ce=
ph2.c?ref_type=3Dheads#L1039

This appears to be caused by the perms set earlier and passed to the
ceph_ll_listxattr(). These are set at
https://gitlab.com/synarete/samba/-/blob/vfs_ceph_ll/source3/modules/vfs_ce=
ph2.c?ref_type=3Dheads#L533
using the uid and gid in unix_token.

By adding instrumentation, we can see that the uid/gid set in the
unix_token at this time is for user nobody/nobody which is mapped to
anonymous user. This user obviously doesn't have permissions to modify
the file.=C2=A0

At the same time, I can also see that getuid()/getgid() returns 0/0 and
geteuid()/getegid() also returns 0/0. Does the default plugin use
uid/gid 0/0 while performing this operation?

I have the following questions
1) What are we testing for with this smbtorture test?
2) Is the anonymous user allowed to modify the DACL of the file as done
in the test? This would obviously lead to access denied errors as we
see currently.
3) What uid/gid should be set when performing this action as the
anonymous user?

Sachin Prabhu


