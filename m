Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D09115F0
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2024 00:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iLJV2+wo/zseHrrWV0YEIwEct+KOy1nwZ8ZyGWZXqZ8=; b=OZm7SZ/4a3E911ZEYrDfaesnlM
	N/Wm1DOhT8/A/IyrQhtmjmh/ZEqeAKZbeqbfHq1zDDg7Gyw5VJvZlOPM/lIKAQwuTmVyMUo0fHHwd
	QyAbD8KvfzwDJfx25OFGPI0s0g7hJuvne4lVKp4XJ2kgkfLc8F3RwC684uZTO+aNX9VbO48D4/LWh
	WeR9MLycTM8HhqnbnnipQlYe3BnC/QnutFz6Z1D/748fi7hwo2IwoAzz17m10D1F7bR1gqWlM1PsH
	fNNMY4f3B93vQ+jETuJcIxbilqc5w9RnnD0ElrfocQU/bbGLtJ6F71W2a6mWFK3R6/vgkCj20VL6U
	WitqKgCg==;
Received: from ip6-localhost ([::1]:34934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKQeS-00ElUd-OM; Thu, 20 Jun 2024 22:53:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42694) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKQeN-00ElUW-A9
 for samba-technical@lists.samba.org; Thu, 20 Jun 2024 22:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=iLJV2+wo/zseHrrWV0YEIwEct+KOy1nwZ8ZyGWZXqZ8=; b=uZ7SZ9NYxq33RIrOppnj+vFLX6
 qk7UanG7aqRnzVDCo2koY9AJI3Pz5Vx/vnSMiLcv5m9oUKAUNLc6C4X2AgrthuRwe9nvyqD9vXRKe
 OEW49hduoyt1D1uQKXJBXqooOruL3LzAiJudctaXmgzxJDZg4kM7Ty7s1Qn3m8V4MCy+6/fO01YTp
 I8/xrlWytIBUMb6d0OzQtrelpeW8cWwy+yXCGJlsr2pygvrzv1/r8nfaL2xP9qj+35T33Rehae+kp
 1ObJlG9Thg3+Esn4iQGrok+tw6AuthvjQ/Nkm6r9rKLzub4lVoAJnfPTBUWDiBNzzwCY0iYcza1N+
 RLFsajctzfJxYHY+cqIFWadCTFwZB6WSHMOex6BIgalFwYAMhlWbA570DDL72iejTKp4b/26vA3dv
 tYBB8GTEhChnUpa9OKIxTNFm9Nodk6os95korQTHvPisFm1eCum3idr+U2lIoumxe8+RYvP7P3ot1
 hN2fPZqXf4G8GKwVkBKhqzYH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKQeK-0008GJ-22; Thu, 20 Jun 2024 22:53:01 +0000
Message-ID: <050f14547c398b5d73faf917540f02dc0dee7f74.camel@samba.org>
Subject: Re: vendor version/revision string
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 21 Jun 2024 10:52:56 +1200
In-Reply-To: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
References: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2024-06-20 at 09:46 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> After Andrew added --vendor-name & --vendor-patch-revision options, I
> decided to give
> it another try to embed downstream (distribution) version info into
> the binaries
> (yes, I know all that stuff were there before too, in a form of
> VERSION file).
> 
> And faced the same old issue which I faced before, when I tried that
> previously and
> failed.
> 
> The prob is that --vendor-patch-revision expects just a
> number.  While in debian,
> version string is a string with many words, - even the debian
> revision "number"
> (everything after the upstream version) isn't a number but a
> string.  For example,
> 4.17.12+dfsg-0+deb12u1~bpo11+1 - there, --vendor-patch-revision is
> "0+deb12u1~bpo11+1".
> So --vendor-patch-revision can't be used obviously (as it fails right
> away if something
> besides a number is specified).

Yeah, this was one of those moments when the "smacking my head" meme
felt appropriate, it is set as an int in the configure stage because
otherwise the build fails when we encode it into a protocol structure
element (trying to represent the version in a binary form)! 

I was much frustrated, my simple little improvement was getting complex
(Samba as ever), and thankfully found I could restrict it to an in at
the command line parsing layer!

> So I tried to (ab-)use --vendor-name instead, - adding debian version
> string right to
> this one (there's no need to have both options, one is definitely
> enough).  And while
> at first it worked (for a simple version like 4.20.2+dfsg-1), it
> still fails later during
> build process with a version string which contains a tilde, like
> 4.20.2+dfsg-1~mjt-ubt24 -
> it fails at link time because linker script will contain tilde in a
> symbol name:
> 
> SAMBA_4.20.2_UBUNTU_4.20.2_DFSG_1~MJT_UBT24_PRIVATE_SAMBA {
> ..
> }
> 
> The wafsamba thing is tough to deal with (it's probably the most
> uneasy build system in
> the world).  I tried this change:
> 
> --- a/buildtools/wafsamba/samba_abi.py
> +++ b/buildtools/wafsamba/samba_abi.py
> @@ -288,3 +288,3 @@ def abi_build_vscript(task):
>   def VSCRIPT_MAP_PRIVATE(bld, libname, orig_vscript, version,
> private_vscript):
> -    version = version.replace("-", "_").replace("+","_").upper()
> +    version = version.replace("-",
> "_").replace("+","_").replace("~","_").upper()
>       t = bld.SAMBA_GENERATOR(private_vscript,
> @@ -317,3 +317,3 @@ def ABI_VSCRIPT(bld, libname, abi_directory,
> version, vscript, abi_match=None, p
>       libname = libname.replace("-", "_").replace("+","_").upper()
> -    version = version.replace("-", "_").replace("+","_").upper()
> +    version = version.replace("-",
> "_").replace("+","_").replace("~","_").upper()
> 
> (ugly but ok).

I see Douglas has a better idea down-thread.  Hopefully that can get
implemented. 

> This made the build succeed.  However, while whole version string
> sort of made it
> into the executables, there's still a prob in manpages:
> 
> Samba 4.20.2-Debian-4.
> 
> Yes, it is cut at the first dot.

I looked into this, something is just truncating it before generating
the TROFF.  Even if "4.21.0pre1-DEVELOPERBUILD" is in the
bin/default/docs-xml/build/DTD/samba.build.version then 

.TH "NET" "8" "05/06/2024" "Samba 4\&.21\&.0pre1\-DEVELOPE" "System
Administration tools"

Is what is emitted.  So some truncation the docbook-xml layers that I
dare not even look into. 

Thanks as always for your feedback,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


