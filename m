Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C04B348209
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 20:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=scpTAigWAactJWh8daB5umEZ2dRri0al+n3hfn5nark=; b=EzS9fPpxJ8GxFTQUpjljGhXDhA
	Ge9JZNZX8UoVpRiIM/vuNmUriF5PboZfnPhmkCtnFZR4TPk//r5ll+xkfkU1ZiYKA83PFkI21yp5O
	6O37WYWwLyVBkD9vGG+WyiCG6aaqfHp1BUsPCHLPuiSmfv08Us4+A/FvbK1xLNxuMv71zMquEESD6
	k1cZurfkz3DMRYI3VebXFcpDOiM2FHgfhl8BaUUJrvG2Zev1sup2iax6sHwe7WU2UtORwAgFPl8c6
	VBkr2XgEhnJiuTae/GQhTyeVa5pI+MFlHXDCKU0Dy6BQtsJr8RfDBHFq5taBrJ4ip4tZwJ61FQALY
	jDgcvx7w==;
Received: from ip6-localhost ([::1]:46780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9KK-006deT-AB; Wed, 24 Mar 2021 19:38:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14862) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9KF-006deM-RZ
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 19:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=scpTAigWAactJWh8daB5umEZ2dRri0al+n3hfn5nark=; b=P+TJOMt+DgLCwJ/Ca746u0I4HC
 8IaMrdAiuigT5q/1O3vO1BofsOT7SHJ087R/31KFCro0VZQ8XeCYT+oskj4XsOimNqm9XFEe8mqac
 nslVWTQ9oU3dmA/sdpG0irEvR7SiGr+4rt639Wf29dxXSGHBmsncSoyO1ut/jvOVrQVOZcHyoxiJX
 SHkDoLEXUI1nWIXgcH11LyTejuOEMkD6UWZKz1PFOWWZbJiTVP7w4FVqg08F6j4f5BBSixITaaW3u
 GTi5aljxBNzH4ZGaHL0ifsL1rdwX6wsYBCLbelwg9CBWmL9o1HzSdzGI0thvheKsIlAFKrtn53wdO
 WBim+PxKQVog1EToUmIprJH1tSt01m2QtPczSIrjlYttLL+mLIKhaOoIZSkwqjkpchXk+NcE54MPh
 UdgfaWRqDe/5br92Ia0CBQ98b807TDoPz3VgKty4OdzfHKVhWk/o71nQaqzIlRo0oaT+uzwL4l7D+
 vxmPKrVn6I/pin3g/45DQuG4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9KE-0007nn-It; Wed, 24 Mar 2021 19:37:54 +0000
Date: Wed, 24 Mar 2021 12:37:50 -0700
To: John P Janosik <jpjanosi@us.ibm.com>
Subject: Re: Samba AFS Integration Support
Message-ID: <20210324193750.GA845709@jeremy-acer>
References: <OF02C457C2.057824D7-ON002586A2.00688BB0-862586A2.0068AE6E@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <OF02C457C2.057824D7-ON002586A2.00688BB0-862586A2.0068AE6E@notes.na.collabserv.com>
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

On Wed, Mar 24, 2021 at 01:03:23PM -0600, John P Janosik via samba-technical wrote:
>
>
>Hello,
>
>I saw the discussions about dropping some code in Samba 4.15 and the old
>AFS support included by --with-fake-kaserver came to mind.  That code
>requires AFS to be configured to use single DES Kerberos service principal
>keys so we stopped using it a while back in IBM run AFS cells that I know
>of.  I have thought about updating Samba to support modern encryption types
>for AFS service principal keys but haven't found time in the last few years
>so probably will never get to it.
>
>Regards,
>
>John Janosik
>jpjanosi@us.ibm.com

Thanks John, I'll look into creating a patch to
remove all of the #ifdef WITH_FAKE_KASERVER code.

