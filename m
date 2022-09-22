Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C4A5E6435
	for <lists+samba-technical@lfdr.de>; Thu, 22 Sep 2022 15:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cGltKhIQ7hrXGY9ez5OZcF8VY6FRqGcMLfSiBOWR62Q=; b=AkzCDnJq4sE/Ku03SlJ/08+Gq5
	2HSf1odXQQJDH6g/JbVQYxnV9H1l/TTfdnaUF2fLZgr8SMv1Pot6yw5mUpCfbi5ywjFRzaxwKpFFJ
	DdwHcY0oSBkC7OyO5yWEFrcLulXkHKJOrrgcwrTo027FaXrWR9W6fXmleuAJaCaH7sJlWo/tJJ/Kq
	i8DVIKDss0kKo4v6IvDrew9g/MlURoOgfNWhhNGE0iCHiWAL5UZ1/iRpAGm3v2AgDtdquaTVqCeB7
	1slF8Ii1ZUKfPZvTJ4DrAS0lIFzHVQOtiZwgvNMomQ8BrY0A152TL5Vf+W5e9VhEsaXysJAgWJDKF
	xJWJwkYg==;
Received: from ip6-localhost ([::1]:42056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obMas-0031qm-L7; Thu, 22 Sep 2022 13:50:23 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42884) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obMah-0031qd-D1
 for samba-technical@lists.samba.org; Thu, 22 Sep 2022 13:50:16 +0000
Received: by mail-pg1-x533.google.com with SMTP id t190so9172536pgd.9
 for <samba-technical@lists.samba.org>; Thu, 22 Sep 2022 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=c5EcDDkOGJ5snEW9oniT8coHSpQFQpfgCdY/P2/ZLu8=;
 b=VxO1vWMwnDO3io8ju/cOeCQecc24iI490weDb68MuQapHelKgs+AU17upe+qkKvXZz
 FPhxsUqtT8KgncW+d9o+W4Z4PRDzv+PVq6fL2SRAnqlxh6gE9JgKIfFv2+Q1ashAYea5
 LSHgUCPxOOeQvvLI61S4fuR2qE+fcMwcucNeUkT3gZD34FIj1MqQ7C59QlSDhpuQekgb
 HiMSoc9X/FrZ8ZNCIVWE2xkExisEM1b+i8LqEI9lU7zfTxrjjAncci+lJdQQE597FiSn
 HsoOqbwijb5VM21S/uswafRyIToOec5zTQagGXIBNexgk+f2lhdLg0owdMZlTFudQT7v
 3n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=c5EcDDkOGJ5snEW9oniT8coHSpQFQpfgCdY/P2/ZLu8=;
 b=lL9MdBxUGn6+P5X/4QGBRAOEuWYg49uhSYjp51IGKOuoZ62VbWhYU0pHIZJvU0Ahtq
 IXAI3eLmkOoyNuji/7700jPKz4ivMOARJWVivHvdxwsUv7VcGSJmEFQZserjXWCEcUec
 UtfM0JMZFmiNlo2MK+eEGdKFmF9hZXm4CY7kSx/OmOy1CIpzvq8AInR/dkXoIU9KookH
 3iTQi65DtgwHO1xlb691UT6leLJO+/AT5aVDg7sy9ExvfLw4lszw8STALpBuzwsyk4sN
 7TlSLajVNfovmiv1HpsUUFGlNZ8McmnEVj9xw9uHqVxAn4Ko6p3JLaflNUZVMBX3gv/n
 O4qA==
X-Gm-Message-State: ACrzQf1aiGbTgThSBnrbGeL0YmsNvC4iTdhCKKxuC7HGtjIRU2MuPCrB
 w0Fm0gBwD8zhRyQG8cE3GCl+MtyXl6dietO+tYdsqXK2dvQXnQ==
X-Google-Smtp-Source: AMsMyM5nfk5U6eCvm7ZwFcJvDZ5LfiPB/IOdkpQhA7JyKjQ7elVQ9SKZgcAMreonE3F32ArRF8ZKbs2o+BGvLiYNN4s=
X-Received: by 2002:a05:6a00:2341:b0:546:e236:497f with SMTP id
 j1-20020a056a00234100b00546e236497fmr3779391pfj.32.1663854604030; Thu, 22 Sep
 2022 06:50:04 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 09:49:52 -0400
Message-ID: <CAB5c7xoG+7oowYFG93rdv3cFeNRs7-5r5DOLxObyYg_rTGpyUQ@mail.gmail.com>
Subject: MacOS Ventura, compounded flush and close, and io_uring woes
To: samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey all,

I've been seeing some issues with the MacOS Ventura beta.

```
485 15.031755 192.168.0.164 192.168.0.160 SMB2 246 Flush Request File:
Screen Shot 2022-08-12 at 11.05.32 AM.png;Close Request File: Screen Shot
2022-08-12 at 11.05.32 AM.png
```
Ventura compounds FLUSH and CLOSE requests

```
486 15.032381 192.168.0.160 192.168.0.164 SMB2 278 Flush Response, Error:
STATUS_INTERNAL_ERROR;Close Response
```
We fail with STATUS_INTERNAL_ERROR on FLUSH request because we hit this:
```
        if (req->in.vector_count > req->current_idx +
SMBD_SMB2_NUM_IOV_PER_REQ) {
                /*
                 * We're trying to go async in a compound request
                 * chain. This is only allowed for opens that cause an
                 * oplock break or for the last operation in the
                 * chain, otherwise it is not allowed. See
                 * [MS-SMB2].pdf note <206> on Section 3.3.5.2.7.
                 */
                const uint8_t *inhdr = SMBD_SMB2_IN_HDR_PTR(req);

                if (SVAL(inhdr, SMB2_HDR_OPCODE) != SMB2_OP_CREATE) {
                        /*
                         * Cancel the outstanding request.
                         */
                        bool ok = tevent_req_cancel(req->subreq);
                        if (ok) {
                                return NT_STATUS_OK;
                        }
                        TALLOC_FREE(req->subreq);
                        return smbd_smb2_request_error(req,
                                NT_STATUS_INTERNAL_ERROR);
                }
        }
```

The TALLOC_FREE() here triggers the
vfs_io_uring_request_state_deny_destructor which destroys the uring config,
and closes the ring_fd. Needless to say this is slightly less than
felicitous.

I have two questions regarding this:

1) Are we sure this is the correct behavior vis-a-vis compounded requests?
C.F.  MS-SMB2 note:
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/a64e55aa-1152-48e4-8206-edd96444e7f7#Appendix_A_245
```
<245> Section 3.3.5.2.7: In Windows Vista and Windows Server 2008, when an
operation in a compound request requires asynchronous processing,
Windows-based servers fail them with STATUS_INTERNAL_ERROR except for the
following two cases: when a create request in the compound request triggers
an oplock break, or when the operation is last in the compound request.
```
The above appears to be something specific to Windows Vista and Server 2008.

2) Has anyone been working towards adding a more granular cancellation
mechanism for vfs_io_uring?

Andrew
