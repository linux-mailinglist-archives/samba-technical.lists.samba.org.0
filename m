Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C47DBDD5
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 17:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/zqra/cdi6y+dMsOolhqpBcbE6qHsmdFBK9Gz9DP8BY=; b=xptyLWF7YWQUdT0kwoGCTPGs41
	nAcX9qZaOmwsu0S7YTbi8PzBizfQvV7I1GVp3f6ZWfX3Kr538ga8DD7gwiQ8AVWNq6Cf79mY5ArzH
	fvlyJ17Ip3YO+P5HxEaLoClGRI7L5+QTiqZFHBqhlFhJs1P8wgfR9rF0Fca3Cee6SpWSm1+1gpQID
	dlPm5n7AHQX+tFtYrbNETIUkeDb4zPnlYZJU4/JL+ZiQmmm8cJaX+E+RZaJByUFh6Y4TMfL3WPZ1n
	w8Dtivgt9X06nQIoPVkQ4Ao4Xtdl8guxYzaGbE0VXxkAsgLtKIrH+HaLK2Jjf7czWa3fkr8k5P8P1
	76CX3sSg==;
Received: from ip6-localhost ([::1]:40096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxV7s-003Zsm-3o; Mon, 30 Oct 2023 16:28:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxV7n-003Zsd-7g
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 16:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/zqra/cdi6y+dMsOolhqpBcbE6qHsmdFBK9Gz9DP8BY=; b=MxwwvgO7UPpYqToJpzNlQjizWz
 AuULw73z9IfN2LRIhxFqi54wIKgdKiSC323vydtW15QFCHLLyjD0q1A2584aONWs37UgOyTcWgEyG
 pq8500QNLwQeNlhNZ9Ie+GjSfc160Q9w7CqmHLi/UAouB9sFXicXsdgIrHeI3le1/JTdJMkj24t0m
 WrjgEzbdhlufsBtMy/PzZ2jnE+JTMj0fW9287LFuEYL4BfRG4uEWrmCw1/p+YC66AQIWqk7r3jCEf
 bvKz0PbmV+/L1wGFyg6eKQiwJu1PgD9cXR9ZtZiJLyM+1SgVwk4PKwbpsM77asPBxv4Xt/Dpt2kQ0
 B0fHyvaD+8Ye14fr/2ZaC3MqUekXoq/q46QXiY0Pcbwp0w5FjwiBs2DTw+YviwpbJWKSG/qCTGCwP
 AGMsJBO4LNVJ0IVJe0NekVAJkanWtDGDS1YEzY7M7nuIYX8fHWej4sNMk8VbWK3WZWMViisFDpPIm
 62232QLGIs5KNxwhCu6FWEz5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxV7l-003Log-0M; Mon, 30 Oct 2023 16:28:21 +0000
Date: Mon, 30 Oct 2023 09:28:17 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Message-ID: <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 30, 2023 at 04:03:29PM +0100, Ralph Boehme wrote:
>Hi!
>
>I just stumpled over our old SMB1 UNIX extensions code dealing with 
>file creation in POSIX context. There we have in open_file_ntcreate():
>
>        if (new_dos_attributes & FILE_FLAG_POSIX_SEMANTICS) {
>                posix_open = True;
>                unx_mode = (mode_t)(new_dos_attributes & 
>~FILE_FLAG_POSIX_SEMANTICS);
>                new_dos_attributes = 0;
>        } else {
>                ...
>                new_dos_attributes |= FILE_ATTRIBUTE_ARCHIVE;
>                ...
>        }
>
>Why don't we set ARCHIVE for files created in POSIX context? Makes no 
>sense to me.

I *think* it was back from when most servers were running
without EA's, so archive was mapped to a POSIX perms bit.

