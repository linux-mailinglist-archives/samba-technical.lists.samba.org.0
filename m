Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8927F94F906
	for <lists+samba-technical@lfdr.de>; Mon, 12 Aug 2024 23:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lJEiOvZ4xNmqspMod3AGF8ijii7gK6wuTCziyGWvkk8=; b=rYbhv2PWJuNas3yuCTdNVHB2LI
	llys5+1d4VszD3N0NN91WwSUG+1XAMNWGCunyrYOVT1ay3W6CqoS+j+vcjq7z4q1ersEzg0AJtsLr
	fEFTRWN3GnEfBq0SyCO+ZqqsftHOPUjzDlFy++pumYEptj12izbK4j//frZ9dCvyYRN1/Bvh0g8CB
	2l+/wlMZ9cl47Jim+8Dd21zRhe01Xons6cBUF58nf5RXxCVrzZsphrrv955mxNpca/JNa3ZHZJaJh
	N7XgeQo+BSDCv8ZIP1b8EiqlIk/z19m2l8Lpb0c8v9lcbIS+/UcwwZosOX49rImpN0F1HFHtWlIo3
	E+jaolUg==;
Received: from ip6-localhost ([::1]:34180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sdcjy-004U0Y-95; Mon, 12 Aug 2024 21:38:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24176) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdcjt-004U0Q-36
 for samba-technical@lists.samba.org; Mon, 12 Aug 2024 21:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=D6NQPZ//xQOM3mYIXmVsBmRcaXxxhQbuvbij17KFn34=; b=UZYIWjizzTEKbUWvWRgxiHYcZz
 9FEZQD8UpYwQrJfbQLTsmuPJPZPrdTJwlWQ5CAzAKIyXKHqzbvlbH5s0HUvdLJM/NW/a6kx2q/rMv
 pcbhd+m7EsH9IFlAMHPyOzr36jaytJYqCpB+Lwi9/8v1QAV80GpFv1S0DJV9ZEuZ40bz2AiY42YRr
 DG8tSyQn05FWNvJ1iwAfjLRB/y30gFAW3LU+tk5eTjqCjTl2+Q6IM5TwsB5TdXTrgZCFMyiCYSF+K
 jBSLSYyjtHV2Y5tyB+NLpWccOtg5UJ63qtZecyLTPkac9N9BEu4dpjBqhAvOO+BhrjU0cIHOJkcLT
 KVTbkbBKScMUkpfCDz6zr4bYft7f+zbLqWjgP5gPjyTgC4mKmAI2XUROU6maHiwIxrNGanojg80s1
 37gSwDExh09TmAPxeLlumeA/hJNBzYsYkZg8U2pLCn91UuTqKSDudaYiEBsQ4IkrliOcMcXW5bf7/
 5LClyx07t89y512LDcbdvTSY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdcjr-0067Wo-0g; Mon, 12 Aug 2024 21:38:03 +0000
Message-ID: <0ef42b0d9fda725ae617220b19abdfbcc416ee55.camel@samba.org>
Subject: Re: CI can't reach internet to fetch rust packages
To: David Mulder <dmulder@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 13 Aug 2024 09:37:59 +1200
In-Reply-To: <37323893-503b-455c-beb6-fede11a44eb9@samba.org>
References: <37323893-503b-455c-beb6-fede11a44eb9@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2024-08-12 at 15:29 -0600, David Mulder via samba-technical
wrote:
> I'm getting this failure when doing a `cargo test` via samba test in
> CI:
>      Updating crates.io indexwarning: spurious network error (3 tries
> remaining): [7] Couldn't connect to server (Failed to connect to
> index.crates.io port 443 after 42 ms: Couldn't connect to
> server)warning: spurious network error (2 tries remaining): [7]
> Couldn't connect to server (Failed to connect to index.crates.io port
> 443 after 0 ms: Couldn't connect to server)warning: spurious network
> error (1 tries remaining): [7] Couldn't connect to server (Failed to
> connect to index.crates.io port 443 after 0 ms: Couldn't connect to
> server)error: failed to get `libc` as a dependency of package `config
> v4.21.0 (/builds/samba-testbase/samba-o3/rust/config)`
> Caused by:   download of config.json failed
> Caused by:   failed to download from `
> https://index.crates.io/config.json`
> 
> Caused by:   [7] Couldn't connect to server (Failed to connect to
> index.crates.io port 443 after 0 ms: Couldn't connect to server)
> Doing `cargo build` during the build phase does not fail to download
> dependencies. Any one know what's causing this?
> https://gitlab.com/samba-team/devel/samba/-/jobs/7566611520

It will be socker_wrapper, I think we now have code to stop our tests
leaking out.  
If you want access to the real internet, remove the socket wrapper
environment variables or otherwise disable it. 
But also, don't do that.  At least in the past, the autobuild host does
not permit outbound access, so you will need to work with the
sysadmins. 
The preferred pattern from our C model of software development is to
encode dependencies at image generation time, and manually install on
the autobuild host.
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
