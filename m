Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 227638994B5
	for <lists+samba-technical@lfdr.de>; Fri,  5 Apr 2024 07:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=COOQ3zPqnwUk//BUHWKmf7XZkjh7iZQi/WhJr5IvTyM=; b=hziBlbuPou9z/EhnyhANr2o2hs
	6M8K16Ad78ZWqH5ClIYA+r1AZA4i9JI0YARBe/YpmoT3IKtf+LmFIevKTnoBuu1a3yfmdXAQ1pQ6c
	L900M13+hJqRvmuA7qlqgLwuJM7lQF814q73k5W/P1zwy+mLiCiEQ3kz8idZB+Ss9qcWFmFFZ8B6h
	3ZgyixOBA23DhcMRiEIE+1wGtCf3pePLyvbMUsnw4+EqH6xU/smWC1bdRsffLnqOr1GKVikSl9n7P
	4+JJTe6YG8WTg171I2DcSRa7diiHZQNMUXf+xrxGZdUKvTED4fceQ41F1FtESr8QSPuGTETK4kPE8
	jzC6mMJg==;
Received: from ip6-localhost ([::1]:33352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rsc1Y-003wqr-O1; Fri, 05 Apr 2024 05:22:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsc1U-003wqk-2m
 for samba-technical@lists.samba.org; Fri, 05 Apr 2024 05:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=COOQ3zPqnwUk//BUHWKmf7XZkjh7iZQi/WhJr5IvTyM=; b=FhEWYQTazcXbRCOMuIx2tlWdax
 wOMTROv4M2RNhXjZsnN/7eDA+qJfmzjwfEnftX0iD5VV3shSeL/wxsCOgcAjIWbZ6cNBtivww484S
 /94jnMzVEGzUjzFPsoVbUjrfmUy1ShjpT5LZqC8v7PKbJFkuIDcjMEGfzNSHjz2KD9atE2V6ZmhQw
 MA/yoWSmQj43gWyRobUSNfiGYCtKTXQr2s+cNtX5/05xuNnXCVwaYz8mCKtS058SG4jM5AYmNy7NE
 JT3bltZRD2UroTf4pIUbypHH/4zLaRItLsKz6stCZv+bhUUBB9lopasYKBOkQWSgPzkDrRTd2Ixbl
 Zw0hz9Tnv36HzyqLS07xvr3ISQXmNzpNorfRjO59kGv1BaAn+i3uslFWdEdfL0Hqq51FRSnjJYO/v
 SnMTt5Rw9dcaN96Wl2rOA8K4j2fJSOq+kv53Kqck7Chf/u0WOwuPnJQ/72wUDa/YjwR+ci042mbae
 jaGveuKA9KDrNPc1+53xQBqm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsc1R-004pPz-15; Fri, 05 Apr 2024 05:21:53 +0000
Date: Fri, 5 Apr 2024 16:21:45 +1100
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Simplify copy-reflink code
Message-ID: <20240405162145.40ac3bc4@echidna>
In-Reply-To: <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
 <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 4 Apr 2024 18:46:11 +0200, Ralph Boehme via samba-technical wrote:

> On 4/4/24 03:58, David Disseldorp wrote:
> > I had a quick play with your changes. BTRFS_IOC_CLONE_RANGE fallback is
> > triggered by the existing smb2.ioctl.copy_chunk_tiny test. strace
> > indicates that it's doing the right thing on the syscall side before and
> > after your 48d8b9c7ad5 ("vfs_btrfs: fix BTRFS_IOC_CLONE_RANGE fallback")
> > change (with ret = -1 reverted back to ret = ioctl...):
> >    ioctl(30, BTRFS_IOC_CLONE_RANGE , {src_fd=28, src_offset=0, src_length=48, dest_offset=0}) = -1 EINVAL
> >    ...
> >    copy_file_range(28, [0], 30, [0], 48, 0) = 48  
> 
> oh, yes, sure, the fallback for a copy-chunk request will work, because 
> that goes via VFS_NEXT in the READ_SEND function, so vfs_default known 
> about the token.
> 
> What will not work is the fallback for an DUP_EXTENTS ioctl. If you eg 
> modify the test smb2.ioctl.dup_extents_simple to use a lenght of eg 1 
> bytes, the ioctl will fail and then calls 
> SMB_VFS_NEXT_OFFLOAD_WRITE_SEND() which will then fail in vfs_default as 
> that doesn't know about the token, because in READ_SEND in vfs_btrfs we 
> create the token/fsp association via the db ourselves for the 
> DUP_EXTENTS case.

Yeah, it's the dup-extents->CLONE_RANGE failure handling which is indeed
missing test coverage.

> Now the interesting question is whether the fallback to normal data copy 
> is actually correct if the client explicitly requests DUP_EXTENTS. 
> Afaict it is clearly not correct and my change to consolidate 
> DUP_EXTENTS implementation in vfs_default actually doesn't have a 
> fallback if an SMB2 level DUP_EXTENTS fails in the ioctl().

I don't think dup-extents should fallback to copy; with the initial
implementation we had VFS_COPY_CHUNK_FL_MUST_CLONE to make this
explicit. However, the MS-FSCC spec doesn't appear to state that cloning
is a hard requirement, only that it should be supported alongside
FILE_SUPPORTS_BLOCK_REFCOUNTING and that offsets+lengths need to be
"logical cluster boundary" aligned.
We probably need to do some testing against modern ReFS to check some of
these questions.

> But as the current code had this behaviour until I broke it with 
> af6cbc7a441e05f71ae4e97c7d82c27868633e53 and friends, I wanted to bring 
> this to your attention and get your feedback before proceeding. :)

I appreciate you raising this :) The rest of the changes look reasonable.
I'll follow up there in the gitlab MR.

Cheers, David

