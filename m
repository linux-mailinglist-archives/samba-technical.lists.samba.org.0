Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BED40470C72
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 22:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2utFcEQE7rwQ2NRNcaWaNu92Sa9azEiHLTM2p2N6ZDI=; b=D6/JXCrQ65YjKvTy76S10IBWud
	PBzBSiPMcmf4R6IKsjhwtY350UJRopDX+1nYI1+V0yK0cpo9Z+CNugwFMaUDC3go5T4yNpPraQKG7
	ZRaXMAswiVEq/02cQYIyER5mU+YqVpI950EkW18q/DSAdi8tiC6KmnWbb00XwDQxOcWgbrGrCB3uz
	HbgfsNlo2E36jV97/ms9j+xuBWH6Oxn8dFh6mo3Z+CL9G41fBVFHhBmpy8mrvjyWlPp/6E9vLZnND
	lX/dGQKIo3WDBYRAN6mpwiFAA57Z5YaApJma77kfTjXom9mi9d8oiU7PK3UJGaKi88F/G9D+itnF8
	YDcBn68g==;
Received: from ip6-localhost ([::1]:50426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvnKA-0056uK-MA; Fri, 10 Dec 2021 21:21:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvnK5-0056uB-5U
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 21:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2utFcEQE7rwQ2NRNcaWaNu92Sa9azEiHLTM2p2N6ZDI=; b=zYa5ngMBFKbtB+zr5AmQaeNSNw
 FXNxDQkqETym8dINbsuWroqwYsYgHIp9jGPJlmxmdVUzYUM8BRtbdJppfrAHL9CVzgX5P37kdq4qJ
 xaOPa/6E1m+XFRgqc54/ZdsgRNbuuFM8ExK31Y8ShMcCDUA9wYqFF20jrxHyNDih/IgIWcC8bOW6l
 0CoP/XOixP09SfPpTO2R1hwBQlpmf+iqDTnI3XavasjdM8cdMhhEwMKrZc+tm8xQDX1CY80e+/QLV
 odMy6AjF6/mqHY4kO6yxAZK4UQ1iKMQbBsnXl5dfpnfMewMfTHEI/CWKWSevJVHH94dhYYMAx3Nfm
 0OuCcTLV4aZxVdGXtGBEG5I+Q2Yt1n4WBgwmVNhrvrCRvqEQF/K0+vji85cwc1PFWWTpBRC6N1i9w
 13ZQUXaCVrl0eog/hNCSDUPaIIcP/Pt55nvIhK/buKloYZwBQLQU7rK3KkqyZimtt579Ayp4cUECs
 Nrte9PHGa406yHWmikDttT+h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvnK2-002EMV-6z; Fri, 10 Dec 2021 21:20:54 +0000
Date: Fri, 10 Dec 2021 14:20:51 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <YbPEs2tQD0CP3yXV@samba.org>
References: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
 <CAB5c7xp+Gs05F3RLX+Zwkx4=WRFY0Wb__bNnbf9Oc9oVv77d7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB5c7xp+Gs05F3RLX+Zwkx4=WRFY0Wb__bNnbf9Oc9oVv77d7Q@mail.gmail.com>
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
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 03:37:57PM -0500, Andrew Walker via samba-technical wrote:
> On Fri, Dec 10, 2021 at 2:08 PM Christof Schmitt <cs@samba.org> wrote:
> 
> > On Fri, Dec 10, 2021 at 09:57:07AM -0800, Jeremy Allison via
> > samba-technical wrote:
> > > On Fri, Dec 10, 2021 at 06:06:56PM +0100, Ralph Boehme via
> > samba-technical wrote:
> > > > On 12/10/21 17:56, Andrew Walker wrote:
> > > > > That's a good point, but if MacOS SMB client is faking up an inode
> > > > > number based on a hash of the filename in the zero-id case, isn't it
> > > > > even more likely to yield a collision at some point?
> > > >
> > > > well, it's somehash(name) combined with the parent-inode number. I
> > know,
> > > > it's not ideal.
> > > >
> > > > But going back to inode numbers brings us back to:
> > > >
> > > > https://bugzilla.samba.org/show_bug.cgi?id=12715
> > > >
> > > > *scratches head*
> > >
> > > OK, seems to me that we need inode numbers by default,
> > > as that's what works with both Windows an Linux clients.
> > >
> > > If Mac's need special handling here, then we have the
> > > capability to detect them and switch out the inode
> > > numbers for Mac clients (fruit... :-) :-).
> >
> > Not every Samba server where Mac clients connect has vfs_fruit enabled.
> > And requiring vfs_fruit to prevent data corruption seems like a big
> > step. The requirement for Mac clients is the same, no matter whether
> > the fileid is generated in vfs_default or vfs_fruit.
> >
> > The initial problem is fairly easy to recreate: Use a Samba version that
> > reports inode numbers as file ids, create 100 different files with
> > different data from MacOS. Now go to the file system, delete those files
> > and create files with the same name and different data. Then read those
> > files on the Mac client. Chances are that the Mac client will now show
> > the data from the old files (due to the fileid based caching. If a new
> > file got the same inode, it has the same fileid).
> >
> 
> Are we sure about that? For the fun of it, I just rewrote how we were
> allocating file_ids so that they were derived from smb_fname->base_name.
> 
> ```
> Andrews-MacBook-Pro:share2 awalker$ cat testfile
> CCC
> Andrews-MacBook-Pro:share2 awalker$ cat testfile2
> BBB
> Andrews-MacBook-Pro:share2 awalker$ stat testfile2
> 872415469 3840159432845878725 -rwxr--r-- 1 awalker staff 0 4 "Dec 10
> 15:24:36 2021" "Dec 10 15:27:17 2021" "Dec 10 15:27:17 2021" "Dec 10
> 15:24:36 2021" 1024 2 0 testfile2
> Andrews-MacBook-Pro:share2 awalker$ stat testfile
> 872415469 398 -rw-r--r-- 1 awalker staff 0 4 "Dec 10 15:27:56 2021" "Dec 10
> 15:27:56 2021" "Dec 10 15:27:56 2021" "Dec 10 15:27:56 2021" 1024 2 0x10000
> testfile
> Andrews-MacBook-Pro:share2 awalker$ cat testfile2
> CCC
> Andrews-MacBook-Pro:share2 awalker$ cat testfile
> BBB
> Andrews-MacBook-Pro:share2 awalker$ stat testfile2
> 872415469 3840159432845878725 -rw-r--r-- 1 awalker staff 0 4 "Dec 10
> 15:28:46 2021" "Dec 10 15:29:30 2021" "Dec 10 15:29:30 2021" "Dec 10
> 15:28:46 2021" 1024 2 0 testfile2
> Andrews-MacBook-Pro:share2 awalker$ stat testfile
> 872415469 6066312061719206029 -rwxr--r-- 1 awalker staff 0 4 "Dec 10
> 15:24:36 2021" "Dec 10 15:27:17 2021" "Dec 10 15:27:17 2021" "Dec 10
> 15:24:36 2021" 1024 2 0 testfile
> Andrews-MacBook-Pro:share2 awalker$
> ```
> 
> Behind the scenes on my Samba server I renamed the files. Inodes stayed the
> same when viewed from MacOS client, but file contents changed. This was in
> Big Sur though. Or is this application-specific?

I tested this two years ago, and could demonstrate the problem.

Christof

