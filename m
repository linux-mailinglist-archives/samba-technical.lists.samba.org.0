Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1325B45A
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 21:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lEl/B1ZLqcxxWIdjmjWJzNEDw2y44I9u7EYv4Mt6a1s=; b=T9JMbm0rX/xbcaFPKVdYJ8IPnc
	YRAlwJPIB1bAPAkHprtUZyGCuxMpqdylhnq9nqZF6A69OX7sKig56cqp6leAOkliQqn1uOTioJ2kq
	RB0QsG/tbdtnlOwrjmlhUEwLthplgCA2oJhNZPgiKA/LPnnPQdvgZHbyu26jP/LxHyhJmkn2g9px7
	asjOkITRNmbpu74K64hvVaVdjvSVX0dWZzH5Ycr9zlLYQfDGeyI62YSV+yM5jKXsM4W4A9hDw2f98
	AAF5qFBIUw9V5X90xCp2zaZdWugcZZ7bNcnY0+qYnajUv6C8ZANmadRTZYMlcBxb6uteV1WChWf0e
	awXHLmrw==;
Received: from localhost ([::1]:50102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDYJd-003clR-Jy; Wed, 02 Sep 2020 19:21:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDYJZ-003clK-56
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 19:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lEl/B1ZLqcxxWIdjmjWJzNEDw2y44I9u7EYv4Mt6a1s=; b=vdGdgLvNcMTpLuEDvCn8duOmgi
 q0+l8j6HdB777/HyMzlK88AGI2nA5YWckbk7H0ROOZPEiO1oz5uxNJKD/847dFUh7si+3FS1aJOCC
 4sKcRKoSJ1c+EiXHdvnWAhM0wQSQj5P2tcQRKxjqJIEpCRKW8hk14j1npb5OZFm0N2cOgUh7S63DQ
 UQ9+FQXr5YATVwLtlaT1WLk4Jur4FbUbinznnRUKsE4HM3Yth4MiisXqmmjUSLgrpniPHX7w9DoVz
 n+TfQMCNxCIBVhRkaDTRm0ibo41WmLwYxFJ29SbtWjVuir05GY+RVZ4FZvnDqxW4oWFCi7ORPHv7Q
 YDqTpH9ZMklAk1r+JCuBZ7oLX+VRVhNS20ZsgsFl8SmRPhfvYpe9sYvgHMPsJAmXUZ5tnhQA/ZctJ
 ZUXEajQdBVCryOpT6lFN2dXvgWeWY4ummwNZkP5NJ/pzv88GeiwnXbrGCWXayTRdL4FoAg4zF4S+j
 EmHjr4ZZ/iwEm1vefT74bAp5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDYJY-0006b3-3F; Wed, 02 Sep 2020 19:21:00 +0000
Date: Wed, 2 Sep 2020 12:20:54 -0700
To: Krishna Harathi <krishna.harathi@storagecraft.com>
Subject: Re: Directory Leasing feature in Samba smbd
Message-ID: <20200902192054.GD26967@jeremy-acer>
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
 <20200826173216.GC16382@jeremy-acer>
 <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Sep 02, 2020 at 05:18:05PM +0000, Krishna Harathi wrote:
> Jeremy,
> 
> Thanks for the insightful response on how to start on directory leasing feature.
> 
> After reading more into Microsoft SMB2/3 directory leasing, in our customer case, looks like the windows client is taking advantage of the granted directory lease and maintaining a directory cache.
> 
> I am attempting to setup the following even before writing test cases.
> 
>   1. Using directory lease capable Windows Server 2012R2 (or later), setup a shared folder/directory with a set of files/folders in it.
>   2. On a Windows client capable of using directory lease , map the shared folder to a local drive letter. 
>   3.  Start capturing tcpip packets on either client or server.
>   4. Browse the shared folder on the client multiple times. 
>   5. The tcpip dump should show only a single directory scan set (SMB2_FIND_BOTH_DIRECTORY_INFO requests/responses)
> 
> Is my assumption and approach correct? Is there a better/direct way to monitor the directory lease and cache in the client? 
> 
> Only information I found on Windows is the global configuration values of "DirectoryCacheEntriesMax" and "DirectoryCacheEntrySizeMax" shown with powershell "get-smbclientconfiguration". Are there any stats to monitor to determine that the directory cache is active with entries from the mapped drive that has the directory leased?
> 
> Once this setup is done and confirmed working, I will have a better understanding on what to expect and I will start adding test cases to smb torture.

Hi Krishna,

That would seem to be a good way to explore
how the Windows client behaves. I don't have
good insights into how the Windows client
manages its cache I'm afraid.

One thing I'd also try is to get wireshark
logs whilst browsing the cached directory
and then using the local Windows command
line on the server, create a file in the
cached directory - that way you should
be able to see lease revokation going on.

