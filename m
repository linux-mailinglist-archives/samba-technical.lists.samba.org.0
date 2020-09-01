Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC4259CDD
	for <lists+samba-technical@lfdr.de>; Tue,  1 Sep 2020 19:21:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=C6RKcq2hDWv1tghgUAbB5wYWvX4eKvATcyX+GkafW+Q=; b=wYw2GATPWnh60egXHFE8F9W6cz
	Wnv/euAzWsics/8hohn4kd8c+QYKaRpFrxmtu06KxRYx80Br/eqDINoEkkpVJYQ6aZnGo6RxtlGch
	KeV5shfRxcJT8NbgloVSHYAPPyqdSqXL3xCtRzfjZmKV26lvJd/pL3iIlfmcL7qS9Z+3hazOhp7ay
	iTKsdFvsxgORzECdDSuCY2N2KWVEF4cNTjE1jGu2x+KHC/WBjibXq85LekyqCNKtyRYNdKU0Xnw+2
	GBRwzs+/2MG/xOQu3G0gdcFJNaN18o8H8LTxJlbEybucCZIJic5wgeByxUuL4liui3q6kcGa3Moca
	mvkQTydA==;
Received: from localhost ([::1]:60750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kD9xG-003Ijy-GT; Tue, 01 Sep 2020 17:20:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24834) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kD9x4-003Ijr-LZ
 for samba-technical@lists.samba.org; Tue, 01 Sep 2020 17:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=C6RKcq2hDWv1tghgUAbB5wYWvX4eKvATcyX+GkafW+Q=; b=XPTJq+VB7gXLDGZAh70AenVqv4
 +sYRjla8ZXdlIxZgyv/KYdt/aqmVeATTzvI73Un0ydVcT4iZJcxzyT4mrBkrVvnp5A6AaXKelA2rf
 L2iWvoS2EKrOXEO1+gbXYYCPvVf6JVwI7OI6hwKcqSOwfudhQqC2wHbp3w6nMFvm2XUaMtOg3GI7Y
 ovTQTjp1dF8VvRqt+F4jHR9a3hGbZEyu6w80Q1k89cLekl1gn4yRFJXJDPwEldhRyZT+0rdMlzAn9
 m/Not6WavsLLQucjDRaVvRnVIN1sSCu1S1X1RZw/gvmZhHsKov8gCwzjBXcXXJ2lZdnYDxqJJIG02
 4ExX0r+mRkKrkgYR3hAuwrJhLrWqHvFGgRvmbOdaGV5kgD5WqMz4Lq8ldDBgsWWlDhkZhW20BrgDj
 9xW6DWWHKDUsCU+XlhKVqeGIdRfoq9embOtrz6KJnnXNRfUxXwUosH0ZdhDVx6oDpukW8mra5GUja
 UHULrmjW32MenazVVgY2k82z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kD9x3-0001MV-7o; Tue, 01 Sep 2020 17:20:09 +0000
Date: Tue, 1 Sep 2020 10:20:06 -0700
To: Mahesh Taluru <mtaluru87@gmail.com>
Subject: Re: Unable to create subdirectories/files in samba mount when using
 vfs objects = glusterfs
Message-ID: <20200901172006.GA1043@jeremy-acer>
References: <CAKGR0cv=cGT8TMCfpXM81NstOWdUT=eD9PZXYiO7YsNAK619dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKGR0cv=cGT8TMCfpXM81NstOWdUT=eD9PZXYiO7YsNAK619dA@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 01, 2020 at 08:32:47AM -0500, Mahesh Taluru via samba-technical wrote:
> Hi Team,
> 
> 
> 
> I am trying to setup a samba CTDB cluster to export gluster volme as samba
> share. While CTDB cluster works well, I ran into an issue with creating
> subdirectories and also creating files/directories within subdictories when
> accessing the share from both linux  and windows servers.
> 
> 
> 
> Setup details :
> 
> 
> 
> We have a three node cluster with nodes snode1, snode2 and snode3. I have a
> gluster volume named smbshare32 exported as samba share using vfs objects =
> glusterfs (libgfapi).  When I mount the share on linux, I am able to create
> files/directories in the root of the mount point i.e under /smbshare32.
> 
> 
> 
> [root@sclient1 /]# df -h /smbshare32
> 
> Filesystem                      Size  Used Avail Use% Mounted on
> 
> //10.4.0.31/gluster-smbshare32  600G  6.1G  594G   2% /smbshare32
> 
> [root@sclient1 /]#
> 
> 
> 
> [root@sclient1 /]# cd /smbshare32
> 
> [root@sclient1 smbshare32]# ls
> 
> [root@sclient1 smbshare32]# mkdir subdir1
> 
> [root@sclient1 smbshare32]# touch a
> 
> [root@sclient1 smbshare32]# ls
> 
> *a*  *subdir1*
> 
> [root@sclient1 smbshare32]#
> 
> 
> 
> When I switch to subdir1, I cannot create files or directories. Same issue
> happens on windows , but I get a different error message it says “the file
> ‘ ‘ is too large for the destination file system.

Get a debug level 10 log from the connected smbd. That should
make it very clear what is going wrong.

