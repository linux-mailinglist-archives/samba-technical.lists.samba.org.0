Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AF436A93
	for <lists+samba-technical@lfdr.de>; Thu, 21 Oct 2021 20:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=muohcr1rSabsYrJj9NyvNJaXQHPl+iSey7ResmKguE8=; b=FSYGdB8H4Mrulg3I65RX/LPCjF
	q+xerCZ9YqTpG5nN7wm3i0H7cPNU9EERAP1OG3Fgw9FHXFK5rqR9eNRfa8scDPe6NEKxZTDz9BSHw
	YZNWJ+fiUMPggERVNKT2v7kZzICJscdK6vLlzmGG0M4fTH1GEx7Ohw14G+lDvbOfsFkdjtU1QfShi
	RoOBlgaviZhWqJMW03QukkBQmuhXtEkU89U5LWUZSxG5Aho5Hhfz1CtymQZsnylGY2pi0fZUrID4S
	nnbLXJRwv+wVxgY0v56Xw9tA+mwqMtXyMwmihYRFhYZlY8yTnJ7jO4cHRY2RvfDPshl4xSnvSdFj8
	AGf9+V8Q==;
Received: from ip6-localhost ([::1]:60882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdcr5-00AzTS-Cl; Thu, 21 Oct 2021 18:31:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56566) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mdcr0-00AzTJ-Ep
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 18:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=muohcr1rSabsYrJj9NyvNJaXQHPl+iSey7ResmKguE8=; b=AiTGRwelusONabGfVfPo9oV4HV
 BDt2ssB3FBh7DZFeB1F3eSdJVDIGycIMw2FJ0SONpciiXCKmtqi/0mO4paoYRtdKXVnFV/qPq3jbb
 ZuVQWNtBF2s4JEK+cmXelp1ZfCLygbSS9LJp+9DVDpe2dRcxOXGd/YgeroIE27dOxiCr797bY9r+c
 9rmCDShm32lFq8LK+mhS6tgCMAmD2dT9bSokJn9hb40GnZSjewmEjiuDGPYNUqQK1Jrm/wU+5LYJv
 2nd03A/BbCOSw+QgGG3oIczXQvgbOqBTZ6XZrowou8x/trMTO7ZmVjoVHcCzNmMXPw+aHsVsQKFoT
 eoHhQbjr6nDAdDPouQMttmp049WzA3lNxqqI7IAPfp/iahYwPIpa4OCjgpmCtOd4/McTYQRnZcZHZ
 z8h66sJB4LI0RF/c4+zYmAed2JsDG6tcmuttWvMjjgu0vHHVFxI3YG6kjtqv2t4lymbNb/jj6GPQ3
 JHWMoqYWuSEVuWKJV8t2xmb+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mdcqx-002aF0-5T; Thu, 21 Oct 2021 18:31:47 +0000
Date: Thu, 21 Oct 2021 11:31:44 -0700
To: Pavel Filipensky <pfilipen@redhat.com>, samba-technical@lists.samba.org
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXGyEPiGNwaXyPln@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXGh+Mp1s/oMnHzU@jeremy-acer>
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

On Thu, Oct 21, 2021 at 10:23:04AM -0700, Jeremy Allison via samba-technical wrote:
>On Thu, Oct 21, 2021 at 10:05:47AM -0700, Jeremy Allison via samba-technical wrote:
>>On Thu, Oct 21, 2021 at 06:35:35PM +0200, Pavel Filipensky via samba-technical wrote:
>>>Hi,
>>>
>>>if on local linux file system there is a directory with only one file - a
>>>symlink pointing to a non-existing file then:
>>>- from SMB point of view the directory is *empty*, such symlink is not shown
>>>- but SMB does allow to delete such *empty* directory, it gives
>>>NT_STATUS_DIRECTORY_NOT_EMPTY
>>>
>>>This is seen with samba 4.10 and 4.13. Could there be a difference with the
>>>latest samba?
>>>
>>>setting those smb.conf params has no effect:
>>>
>>>allow insecure wide links = yes
>>>unix extensions = no
>>>follow symlinks = yes
>>>wide links = yes
>>
>>Can you try setting the share parameter:
>>
>>delete veto files = yes
>>
>>I think this will allow a dangling symlink
>>to be removed when a directory is deleted
>>(at least in 4.15.0).
>
>Ah, just checked - it doesn't work due
>to the check in can_delete_directory_fsp()
>due to this code:
>
>1930                 if (S_ISLNK(smb_dname_full->st.st_ex_mode)) {
>1931                         TALLOC_FREE(talloced);
>1932                         TALLOC_FREE(fullname);
>1933                         TALLOC_FREE(smb_dname_full);
>1934                         DBG_DEBUG("got name %s - can't delete\n", dname);
>1935                         status = NT_STATUS_DIRECTORY_NOT_EMPTY;
>1936                         break;
>1937                 }
>
>if dname had matches a veto file parameter then
>it would allow deletion, but not if it's a non
>vetoed pathname.

Done lots more investigation on this, and it looks like
recursive directory deletion with veto files is broken in 4.15.0.

I'll log a bug and fix..

