Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D59205E68D7
	for <lists+samba-technical@lfdr.de>; Thu, 22 Sep 2022 18:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=i4qcFyRMo3p7w8JPVEgtD6/3xO2fPHoYa9hbOV+eLGE=; b=cqpVVmimOj/T7CxXLTooUgNwJd
	9zeEJ63pMnaxmkPY4fJWHZJdZuUYY1osPiIpYPVUJ9PqsAGo38GPmVVqC/ooAzxtvZg+8WVLWRTeO
	Z4wxkideRuP+E3dFwNOxG9IgCS3bte28T68PQzPHQXCSSHl34jYmIUfGj5De61Wy5NXkBRRqgZUtI
	6RiaFbxW2XzHwzitpkfizbm1jRIXdwPYbCT59s7O16ULvGxW+tlVl3H6jQK2UlLQErEwNQ2sRx0rz
	WamW6ms3kFjVyqUGX2kxvHaYnCTK/9VEYBUx7Dcz8iO9T0kTV87VkgLBFAssYylVGSQQx18tbe0Mx
	aOejQvpw==;
Received: from ip6-localhost ([::1]:21322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obPRx-0035Sq-EY; Thu, 22 Sep 2022 16:53:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45832) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obPRs-0035Sh-4G
 for samba-technical@lists.samba.org; Thu, 22 Sep 2022 16:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=i4qcFyRMo3p7w8JPVEgtD6/3xO2fPHoYa9hbOV+eLGE=; b=xMk/ymTFsy9JMxY/LexMVhtETC
 jM5pRDTguOXX5ApkdhnURnJWQIZ5E0Owdqe3QSorReWlbrSRc0dZcu2u2K8RUgc5gcSQtYdidurBG
 HrEPRNXuZbYxoblTr9kvI4jZmmh7SeEWH4ct35QjK60WgN/vexX7HKIsdwQdFZBog/TiOno758sfT
 LNE0IFFENwhpr1OqaVpsJWDrNzHQu46Z9y55ks4b9CD29/4V58SCzhIaihgoz41kBdvX8zlk1DTmL
 hEo+/SuPSgxZ766zl/ZeUaxo/R7T9yQXfjF5el37N1A3kFSvK2mAIYyj/u+Pci1e0AkOmH/kGCWAH
 R7SmlzHuWBYTgmPRtdU3v0sKW4xdXmTYCL69vEVACsXVNOhBMdz62hj2tR9KUnFmshjrSQ44fuyZ9
 KugK7fwIZ5tF6dyKCnwrmq7nqAIffOuI4k8UeHZNxTRFHK+NXI58QSj09sLV3ZlLvetAeUjJeOegh
 jT5ImVg0CVyzjKz7CLNuUUFN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1obPRq-001VVT-Pd; Thu, 22 Sep 2022 16:53:15 +0000
Date: Thu, 22 Sep 2022 09:53:12 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: MacOS Ventura, compounded flush and close, and io_uring woes
Message-ID: <YyyS+KYVuyCS6au+@jeremy-acer>
References: <CAB5c7xoG+7oowYFG93rdv3cFeNRs7-5r5DOLxObyYg_rTGpyUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xoG+7oowYFG93rdv3cFeNRs7-5r5DOLxObyYg_rTGpyUQ@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 22, 2022 at 09:49:52AM -0400, Andrew Walker via samba-technical wrote:
>Hey all,
>
>I've been seeing some issues with the MacOS Ventura beta.
>
>```
>485 15.031755 192.168.0.164 192.168.0.160 SMB2 246 Flush Request File:
>Screen Shot 2022-08-12 at 11.05.32 AM.png;Close Request File: Screen Shot
>2022-08-12 at 11.05.32 AM.png
>```
>Ventura compounds FLUSH and CLOSE requests
>
>```
>486 15.032381 192.168.0.160 192.168.0.164 SMB2 278 Flush Response, Error:
>STATUS_INTERNAL_ERROR;Close Response
>```
>We fail with STATUS_INTERNAL_ERROR on FLUSH request because we hit this:
>```
>        if (req->in.vector_count > req->current_idx +
>SMBD_SMB2_NUM_IOV_PER_REQ) {
>                /*
>                 * We're trying to go async in a compound request
>                 * chain. This is only allowed for opens that cause an
>                 * oplock break or for the last operation in the
>                 * chain, otherwise it is not allowed. See
>                 * [MS-SMB2].pdf note <206> on Section 3.3.5.2.7.
>                 */
>                const uint8_t *inhdr = SMBD_SMB2_IN_HDR_PTR(req);
>
>                if (SVAL(inhdr, SMB2_HDR_OPCODE) != SMB2_OP_CREATE) {
>                        /*
>                         * Cancel the outstanding request.
>                         */
>                        bool ok = tevent_req_cancel(req->subreq);
>                        if (ok) {
>                                return NT_STATUS_OK;
>                        }
>                        TALLOC_FREE(req->subreq);
>                        return smbd_smb2_request_error(req,
>                                NT_STATUS_INTERNAL_ERROR);
>                }
>        }
>```
>
>The TALLOC_FREE() here triggers the
>vfs_io_uring_request_state_deny_destructor which destroys the uring config,
>and closes the ring_fd. Needless to say this is slightly less than
>felicitous.
>
>I have two questions regarding this:
>
>1) Are we sure this is the correct behavior vis-a-vis compounded requests?
>C.F.  MS-SMB2 note:
>https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/a64e55aa-1152-48e4-8206-edd96444e7f7#Appendix_A_245
>```
><245> Section 3.3.5.2.7: In Windows Vista and Windows Server 2008, when an
>operation in a compound request requires asynchronous processing,
>Windows-based servers fail them with STATUS_INTERNAL_ERROR except for the
>following two cases: when a create request in the compound request triggers
>an oplock break, or when the operation is last in the compound request.
>```
>The above appears to be something specific to Windows Vista and Server 2008.

The behavior of going async inside a compound request is less than
well documented. This statement:

https://lists.samba.org/archive/cifs-protocol/2017-July/003064.html

is incorrect, as my early test code run against Windows 2022 shows.

I'm planning on raising a dochelp request to get this clarified.

The MacOS client coders are aware of this issue and I believe
(but cannot speak for them) that they're planning on removing
this behavior before general release.

