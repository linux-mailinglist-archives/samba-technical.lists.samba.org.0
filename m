Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DA4368BA
	for <lists+samba-technical@lfdr.de>; Thu, 21 Oct 2021 19:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Is419vZjw3z1utqJldXjvSdqopH+kFSuX3Pgo+DVwjA=; b=FCJg9/SY3TkVCAfEb5I8umRF6o
	LsSkiFvg1A4CwF6oBsdIjxreoX8wXJpN9mYtjBtvKo+1cYhgl7q3Zf0Ow1fREZLmOn2UcCl5/sZgD
	EcMHHT5VaUIAsw1hmhniwCqgKeeWLRvnWFxao5l9siOysAM3FJjqQPkmVVZ/951enQYx48bWyL58y
	/nQEyREPUoja++YEn/5UVu2mhQSrR/3oN0seuJAr0HgWfESUduDajy3xX9qvDUwhyotOKT1zHzT9r
	Wd6pYOzpYg5x8xnoBxrcDuCET3zgNS4lF9j2pP7vy96xlwsbvJc+qnO7S4Y0z1NO7uIUXbUdcpP9+
	wDFd63LA==;
Received: from ip6-localhost ([::1]:59486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdbVt-00Aynz-PN; Thu, 21 Oct 2021 17:05:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56562) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mdbVn-00Aynq-9q
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 17:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Is419vZjw3z1utqJldXjvSdqopH+kFSuX3Pgo+DVwjA=; b=wN9meelCg88PUD6/F1WK06OXBB
 PzeOIhZcdNkjHsVOHjm+5UIhhUtrHOKVsIy882JSANWpi1V4juyaqsUnSTo6JXk+3r/fG9MPYv5F+
 H5rVQJIUXOPpmawOT+sLWxmhkGJpeSwRMw8ygkiVjN/G6CNnutjm3rNvL09+GTWjiw5XKqyxLEkkj
 G/LXNyPNRrbR+PeC27nvNVrcStkfktRB1y4/qRZs9rNpAgibuMNQm30VManKqb1qZrLt2h84Z6uF7
 bsfMRtMJX5FKxmXe66Oa0jk4uqxjGxW4f6nymaF6cqneKGzBDWOLmJ4MXt1whitNZhak7TvNIpLfc
 wu+ElG++9fHQEmShC8Vo5LjpVYnxj9FbnvUjuFdQyDTg/P73McKa2bT6z3Wpytx4APqf6Ty0GccwR
 itAkIFsAvkYMcsktzvbUSZXJIqYucWRU81ipSLiFWjjTAzYNbPKztr5GdKOshXxB0odyYR3km3dNG
 F13Bow+qBPcz7fsNEDyfrgRO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mdbVm-002Zii-6i; Thu, 21 Oct 2021 17:05:50 +0000
Date: Thu, 21 Oct 2021 10:05:47 -0700
To: Pavel Filipensky <pfilipen@redhat.com>
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXGd6x6nxD4pHj6l@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 06:35:35PM +0200, Pavel Filipensky via samba-technical wrote:
>Hi,
>
>if on local linux file system there is a directory with only one file - a
>symlink pointing to a non-existing file then:
>- from SMB point of view the directory is *empty*, such symlink is not shown
>- but SMB does allow to delete such *empty* directory, it gives
>NT_STATUS_DIRECTORY_NOT_EMPTY
>
>This is seen with samba 4.10 and 4.13. Could there be a difference with the
>latest samba?
>
>setting those smb.conf params has no effect:
>
>allow insecure wide links = yes
>unix extensions = no
>follow symlinks = yes
>wide links = yes

Can you try setting the share parameter:

delete veto files = yes

I think this will allow a dangling symlink
to be removed when a directory is deleted
(at least in 4.15.0).

