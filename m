Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3163716D3B
	for <lists+samba-technical@lfdr.de>; Tue, 30 May 2023 21:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VIhFBRgPTSRqijwHLYkTXtA8qcXLRXMyMTMV8iZqs9Q=; b=2SfNgdf/pEQ3YOG+ChwqkYafaQ
	ZhsUWbz8hiOpeGdeyDuMVCjvB0VmSpDh6+/mKjiNUyrAqfvsQZRKFPXF8b5XhfFzmm2PBOsvOVqoZ
	6p+fmdvm+wK8+G/Ikk2ATWmdwGL/+oSBHiNFG+hI1bfVa1l27Z7f1wST81pPSCeNXVRVzj0yuLgHZ
	sxI4NIvj/syetjgOP1spjhXZkfBMF84rAh3bfJ/urTDSk4zMKdundyhQlBRcangZVHIdFvnKPO8cB
	PDp53NLdueB8QhQRrtNFtzmRKZqtropwjCrJf2t9y2D39vb+rQUPtFkHYF3v5ODq9YbjtVPCLCSYL
	+Qs5qSHw==;
Received: from ip6-localhost ([::1]:53430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q44lp-00DKo8-IN; Tue, 30 May 2023 19:12:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q44ll-00DKnz-9F
 for samba-technical@lists.samba.org; Tue, 30 May 2023 19:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VIhFBRgPTSRqijwHLYkTXtA8qcXLRXMyMTMV8iZqs9Q=; b=KZY5eFylK7mIwYevDXcP+pwWJR
 7cnoKhEtl8Yn1tIFwrfXRYmYFMtLj5b2ERWhf+aPnUJc3IVeE2h9unMU/Ii+NiHmXBisMmmSCmOAb
 Y733pPOJpqUspYmQZCJ9jX8zlBDloPHnKN+iTz3iXa/B7jUwSpKgipsSrwKsEu72p/EC/KkJhE9kF
 dXuG3xMaD60N6H9bEdRbqcbcDls0cedy7Oq+a7we++h+8iUag1WfM/zK2SnSRJzcZQxFpgb97hzFC
 uJnmIT0QPpxV7yPqxkpEcHiAtaE6kEL+tt6dUZ1qxpE1erDjtnuLtCjYy56BZwaJvReYWmC1Trfsl
 sYo6wSzMEpg66Ske44mO3xRKEqgiNJaPgj7CSrdJeSoGnhZ9mzz9dIKnOO349ipbER6FV35pKn8WA
 l1hRK2QxAjh0f+mx3bxB+LnWok+6css2XRUyM0Cs9TxOFwZZ9j/HcnAfOcHuysEqafZJtSpmr/Vy8
 wpJjHka2/JEWnNlpZFiAkjUy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q44lk-000fox-0P; Tue, 30 May 2023 19:12:32 +0000
Date: Tue, 30 May 2023 12:12:28 -0700
To: Peter Eriksson <pen@lysator.liu.se>
Subject: Re: [Samba] O_PATH, FreeBSD & acl_xx_fd
Message-ID: <ZHZKnEOy9zVDVvhw@jeremy-rocky-laptop>
References: <8A7A544D-F684-4D16-B8C1-102232284BE1@lysator.liu.se>
 <ZHYwZRcPKnVGp+uM@jeremy-rocky-laptop>
 <3BB0DDBD-E0E6-40BE-AD09-0B314F78E355@lysator.liu.se>
 <ZHY3ZwgXSqaYAFLe@jeremy-rocky-laptop>
 <2B15BE8F-0B54-4448-AB5C-00214ACEE3DA@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2B15BE8F-0B54-4448-AB5C-00214ACEE3DA@lysator.liu.se>
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

On Tue, May 30, 2023 at 08:45:20PM +0200, Peter Eriksson via samba-technical wrote:
>> On 30 May 2023, at 19:50, Jeremy Allison <jra@samba.org> wrote:
>>
>> Excellent ! These are the current places where the
>> horrid hack is used:
>>
>> git grep sys_proc_fd_path
>> source3/include/proto.h:const char *sys_proc_fd_path(int fd, char *buf, size_t bufsize);
>> source3/lib/system.c:const char *sys_proc_fd_path(int fd, char *buf, size_t bufsize)
>> source3/modules/vfs_btrfs.c:    p = sys_proc_fd_path(fsp_fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_gpfs.c:                     p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_gpfs.c:             p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_gpfs.c:             p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_gpfs.c:             p = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_posixacl.c:         proc_fd_path = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_posixacl.c:         proc_fd_path = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/modules/vfs_posixacl.c:         proc_fd_path = sys_proc_fd_path(fd, buf, sizeof(buf));
>> source3/smbd/open.c:    p = sys_proc_fd_path(old_fd, buf, sizeof(buf));
>>
>> So these are all the places you're going to run into the
>> same problem with O_PATH opened fd's.
>>
>
>If I’m reading that code correctly most of those places seems to (fchown used as an example):
>
>1. If fsp is not a pathref then: fchown(fsp_get_io_fd(fsp)…)
>2. If have_proc_fds is true, then use sys_proc_fd_path to operate on a path (chown)
>3. Then as a last fallback get the path from fsp->fsp_name->base_name) and operate on a path (chown)
>
>That is probably why things seems to work for most stuff for me - except the vfs_zfsacl module that doesn’t try to use the #3).
>
>Hmm. Use openat() or the last fallback? Decisions decisions :-) openat() feels like a better solution but I’m not sure…

Use openat() - DO NOT USE THE LAST FALLBACK. It is insecure, and
only there for old systems that have no O_PATH.

It might be worth your while to refactor this code so
that the FreeBSD openat(fd, "", O_EMPTY_PATH) thing is
an option instead of (2).

