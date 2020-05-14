Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A31D3899
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 19:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fVOXKx10YJ2EksB4FXLwxF/tdAS4lcM+44gSLRF0GC8=; b=nKP3ZfOpEBBBBmnfco6xyuvNbZ
	O2E9UfRmoxNJ9EpaBRZ6VSXKmbi7RopqWAMqBBydrESOEFMVsuTvHO+LfADjJ5hdgg+bYs0YqLEQd
	WRk398YiYeLC8mb/FangloTU/Gck/4JAfTKEjAI3GRw0vxioEHLrEOOI1fb462DBsHDpxALUJ+YiW
	1DQSj6QL1Njg5TwnB8gEDz3E5DZFcaXVIgR7PTtrYZQObnZP2fsR2MsYdohp3kLUM3r/t23NHmjdJ
	Bgz/vLmKyD8FUlnHqLNkQ1QK6n3V3s3NnL+CDkoGNCL7t+T3rjVoDAOV3nB6o6Y2zp98kPSh5qMOR
	3T3pKwBQ==;
Received: from localhost ([::1]:28248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZHvb-004Lc9-CF; Thu, 14 May 2020 17:45:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18610) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZHvQ-004Lc1-Tw
 for samba-technical@lists.samba.org; Thu, 14 May 2020 17:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fVOXKx10YJ2EksB4FXLwxF/tdAS4lcM+44gSLRF0GC8=; b=cxp3c58thnsy6XIxrpAPyMfnNh
 ulEkl08ZY5FHwGjt220kKyJ5ZNu1ywyoTz+H4gk2WMmuNimkhogQ6G+MzdoDpAGsZqvMFPExDsqHL
 Pbv+vJ0BHJwJLWST9BwSVdKKhHS46TZV6NmSdcUoHNZz9loQji8y1qChMuY1is6O6j8Gx2mrp5XZc
 t4ukF3clXU3iOPNoTNwDsB6MjhJqqdZGj4YBaoMjtyIVMxE7lSOeU6vjgugdrv70x51gzI7MAqCwM
 HaDDkzAlSOzvvkllACnMod0+P0j2CkytyaeyN0+5Btd+6HDnAHkWgJbPrLaQLU/38/cNSvgagZAf/
 +GSVpmP4k57QW5TsJAwin9osujaLneqTnUSKo/OFDZNidas8p//PbelPGrEN581bSb5GBY23jZvMU
 lVQqfu/sjBnix+wMZZ13qlPJewp6hmiDfsJvVCxRzs3hlQJTiRqYl1knJUj3Fsv8icJqbVoIFLs04
 RDXoy8erIafW0AyjU0cis70l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZHvP-0005nB-Nt; Thu, 14 May 2020 17:45:40 +0000
Date: Thu, 14 May 2020 10:45:33 -0700
To: Michael Adam <obnox@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200514174533.GC13942@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
 <20200514075904.GA150211@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514075904.GA150211@samba.org>
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 14, 2020 at 09:59:04AM +0200, Michael Adam wrote:
> 
> To understand, I traced it through. The desired_access is handed
> through from torture_smb2_testfile to access_mask in
> open_file_ntcreate, where it is treated separately, and there,
> unx_mod and access_mask are handed to open_file separately, and
> not mixed up.
> 
> And the initial unix mode that is set does not seem to contain
> the X bit unless the "map archive" is set.

Yep, that's the difference in behavior from the man page.
See my explaination and (completely untested) patch :-).

> But the question is still, why does the smb2.read test pass
> and not fail at source4/torture/smb2/read.c:270 if I configure
> "map archive = no" in selftest/target/Samba3.pm:2210 ?
> In this case (i.e. acl_xattr enabled and "map archive = no"),
> the file st/nt4_dc/share/smb2_readtest.dat gets +x bits set.

It's probably the "inherit acls" parameter that the acl_xattr
module sets by default. If you single step it I think you'll
find that after the initial open(name, O_CREAT, 0644) call
the file on disk has 0644 mode, then the code called in
source3/smbd/open.c:inherit_new_acl() modifies it to
add in the X bit, or whatever depending on the synthesized
NT ACL on the parent directory.

> If I add "acl_xattr:ignore system acls = true", then the file
> does NOT get the +x bits, but the test still passes.
> 
> If I disable the acl_xattr module though, and keep "map archive =
> no", then the file gets no +x bits, and the check fails.

This is probably a test written to confirm we don't change pre-existing
behavior. So if you want different behavior then fix the
behavior, mark the test as knownfail, then fix the test to
match the new behavior and unmark the knownfail.

> So apparently, while you say that this access mode is for the
> access mode on the fd, not on the disk-file, when opening an
> *existing* file, the executable permission of the disk-file is
> still consulted, in form of the ACL, for determining
> whether the desired access can be granted to the FD. This seems
> somewhat asymmetric. But maybe I am not understanding correctly...

See above. Access mode is on the handle, it's nothing
to do with the ACL on the file.

