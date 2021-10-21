Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C94368F7
	for <lists+samba-technical@lfdr.de>; Thu, 21 Oct 2021 19:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=r1rIKELJFl4DatWefP/k29+dyNcjur9AejU0+f5ecr0=; b=CwVW1v+4+/xw/WjzCh2Zwbf1ri
	1Jtssp7+BFnbLin1PrQ1Mt7t72qj1f/o14c4DnUMT8JsNf1NpGmNZwD+RekFWdv5PO7pcgfpmz7sV
	OWFzL8DMoFpmV69qht54MSnSKAfWKO9CCNxJmCadoGMgQ/1HK5dQ4VUnXXbWIsFCTWSWCHaP8KEIg
	PykpnfKPgzrh6KR0LUv2GX14v04eBZ7Hp697zgJgWNRjM2s2CKkiCfB2u4A40tE8Ikq+grHBq3tuG
	VnezDAnB7Z+9EvoD3++9a9HbtXkammWMnDxK+1Fh0bnBMwf6zu4tEnYgbx8s/pumV9IhYj+4rSum3
	LTtDW67w==;
Received: from ip6-localhost ([::1]:60184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdbmc-00Az7p-QJ; Thu, 21 Oct 2021 17:23:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56564) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mdbmW-00Az7f-Rg
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 17:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=r1rIKELJFl4DatWefP/k29+dyNcjur9AejU0+f5ecr0=; b=mqiF3XcICYsC4YDZLtG3iaMyYh
 JLAx2f5Ze19OqiBu6mz/pzRgUKfIcYA/C25WfhLlnOdOV9+3eRqfT5RIT/sjYQy3HxnYCVsrNvmXJ
 4k0KI+2C7GAxGba6nMKcRoxJq0XbZxuAlnavrySAjUSIzHikM9QXFAXvmH3+Td6CpTn1tfoELxD3m
 8JB1Q+liQ4fkDxW5I+jnKfVA+4iMbH708ZDbE9HtZFGsqpjaJd69TD3ZpDrxhZb99BcX3b5UmhO9v
 VnhF+j24UMI6kqdxJLFaUB0Lp/koLLaVlcS7KF/hBEinyl+Ky7pl9Mk+sYoAqqDu19Blp8OSKG/q9
 iY6wlu86N8CJo7LeDI8THqNeQ015Nai3sEdQ7Ft0Z7NZj1uyeI9MJhWWGvZ4PVCW7E06ZxlZbWa1G
 OUV9CPYYHnAcuqaMGbhCvRyXwYDvTxY8qVR9RkVPh52intBMx+RhXkd8O02iqvcsMjblYpOVgJxVR
 TpsHWk1OUFLxiPR+uM4P/9Br;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mdbmV-002Zr1-EI; Thu, 21 Oct 2021 17:23:07 +0000
Date: Thu, 21 Oct 2021 10:23:04 -0700
To: Pavel Filipensky <pfilipen@redhat.com>, samba-technical@lists.samba.org
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXGh+Mp1s/oMnHzU@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXGd6x6nxD4pHj6l@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 21, 2021 at 10:05:47AM -0700, Jeremy Allison via samba-technical wrote:
>On Thu, Oct 21, 2021 at 06:35:35PM +0200, Pavel Filipensky via samba-technical wrote:
>>Hi,
>>
>>if on local linux file system there is a directory with only one file - a
>>symlink pointing to a non-existing file then:
>>- from SMB point of view the directory is *empty*, such symlink is not shown
>>- but SMB does allow to delete such *empty* directory, it gives
>>NT_STATUS_DIRECTORY_NOT_EMPTY
>>
>>This is seen with samba 4.10 and 4.13. Could there be a difference with the
>>latest samba?
>>
>>setting those smb.conf params has no effect:
>>
>>allow insecure wide links = yes
>>unix extensions = no
>>follow symlinks = yes
>>wide links = yes
>
>Can you try setting the share parameter:
>
>delete veto files = yes
>
>I think this will allow a dangling symlink
>to be removed when a directory is deleted
>(at least in 4.15.0).

Ah, just checked - it doesn't work due
to the check in can_delete_directory_fsp()
due to this code:

1930                 if (S_ISLNK(smb_dname_full->st.st_ex_mode)) {
1931                         TALLOC_FREE(talloced);
1932                         TALLOC_FREE(fullname);
1933                         TALLOC_FREE(smb_dname_full);
1934                         DBG_DEBUG("got name %s - can't delete\n", dname);
1935                         status = NT_STATUS_DIRECTORY_NOT_EMPTY;
1936                         break;
1937                 }

if dname had matches a veto file parameter then
it would allow deletion, but not if it's a non
vetoed pathname.

