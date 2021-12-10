Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D95984709E1
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 20:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dkJ3h9q8kPOxVZg9u++r1McyIYFN7b1dA/SwemvpLqw=; b=6KkU06uIM4CjNRC6T5aIov4F0k
	XqXtw1+Jryi+a6rd4UJq71BqT7h0eL9tQFCIPWBIxSABwFqt2jRKn5Yg2o9RElekOaUHB+L7cuGcX
	ua9NqKl7mwlDeKjP5IWKjrkLt/zclys5ZDoR+eYthJAzQ054JGn5Q7b93+tmAhjqkcZfKwtlLHdlt
	Vt8OAOCG74oTxUiCDgW4YXSsGaj4KHaO2/gb/dCUKuB+6vOmgSNn7saRo7HBhEv9FAcvxfKCIiAZ2
	e/IeDNWiCLq1ZJTFtFOdMRTerqJEFtIc78EorFySx38D94T18Dbs+FlcU9M/ynl42YMnvtQ+a+wp0
	8eMLz1+w==;
Received: from ip6-localhost ([::1]:47702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvlGL-0055aq-VJ; Fri, 10 Dec 2021 19:08:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54442) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvlGG-0055ah-6g
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 19:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dkJ3h9q8kPOxVZg9u++r1McyIYFN7b1dA/SwemvpLqw=; b=urZbUhbz0q6W5uviiwy1dVxF78
 ikcGCoiuXArFgUjY+wHUVhdo29M5TJ0LqBcraivXGV0YvZ7a03H78wEx1SnzX6kudspURvUolVqzF
 0+Z5a3SYSC/TVO5372qiFafT64FRycbtMDWHmvnPeCvjXtEq/oME2vWwwsL/n1ytI4Fvy8ASlSUv+
 vxZPZ59dCMWYkUtWdyOI5FtkuP9nNGUWDnfkYBqDFNS4qqk224vlTL+7Kh3huPEMhDpF/dlvjMoTx
 7DYxY9QQKLMGUkRT7U7Qj/JuSZy3MWhzLeN2CVtFg7dC/t1uCWKkmiOrRmhAnAUKvtXxBSX3lYDsa
 MJCNTMZEsv5SdM+nPal1RVcorWmR4KLHdzvnLjWjUkUFyaFTeuDS6r3WlrF7yOKOyGjKgPAri9ebJ
 YeGTtYj4NuV2Y2bk1DypVeCGDKySqHVDO7mfEEw5r2awu5AoBOIyLo8+S7A7xKV5hoqR7OvWzlnaV
 3HG0MMowqw2UQs2jgfa0h7wW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvlGE-002DT6-97; Fri, 10 Dec 2021 19:08:50 +0000
Date: Fri, 10 Dec 2021 12:08:46 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <YbOlvjkCcbp41r0e@samba.org>
References: <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbOU84ZAt6FE81gb@jeremy-acer>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Andrew Walker <awalker@ixsystems.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 09:57:07AM -0800, Jeremy Allison via samba-technical wrote:
> On Fri, Dec 10, 2021 at 06:06:56PM +0100, Ralph Boehme via samba-technical wrote:
> > On 12/10/21 17:56, Andrew Walker wrote:
> > > That's a good point, but if MacOS SMB client is faking up an inode
> > > number based on a hash of the filename in the zero-id case, isn't it
> > > even more likely to yield a collision at some point?
> > 
> > well, it's somehash(name) combined with the parent-inode number. I know,
> > it's not ideal.
> > 
> > But going back to inode numbers brings us back to:
> > 
> > https://bugzilla.samba.org/show_bug.cgi?id=12715
> > 
> > *scratches head*
> 
> OK, seems to me that we need inode numbers by default,
> as that's what works with both Windows an Linux clients.
> 
> If Mac's need special handling here, then we have the
> capability to detect them and switch out the inode
> numbers for Mac clients (fruit... :-) :-).

Not every Samba server where Mac clients connect has vfs_fruit enabled.
And requiring vfs_fruit to prevent data corruption seems like a big
step. The requirement for Mac clients is the same, no matter whether
the fileid is generated in vfs_default or vfs_fruit.

The initial problem is fairly easy to recreate: Use a Samba version that
reports inode numbers as file ids, create 100 different files with
different data from MacOS. Now go to the file system, delete those files
and create files with the same name and different data. Then read those
files on the Mac client. Chances are that the Mac client will now show
the data from the old files (due to the fileid based caching. If a new
file got the same inode, it has the same fileid).

As this thread shows, timestamps are not a universal solution.
In vfs_gpfs, we are able to retrieve the inode number and the inode
generation and use that to generate unique ids. That seems to work
reasonably well. But even the standard Linux statx() call does not
return the generation number. So that would only be solution for file
systems that that provide an interface to query the generation number.

For additional fun, the spec says:

    2.1.9 64-bit file ID
...
   The identifier SHOULD<10> be unique to the volume and stable until the
   file is deleted.
...

So technically the Mac is wrong to expect identifiers to be unique
across file deletions. I assume this comes from the old MacOS file
systems that have a CNID that is only increasing.

I am not sure how to solve this for the general case...

Christof

