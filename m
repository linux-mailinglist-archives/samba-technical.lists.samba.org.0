Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127994F8F8
	for <lists+samba-technical@lfdr.de>; Mon, 12 Aug 2024 23:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jLRcwOz+XjdQ8VNc7x+LXqcsVnDyKa4YGUQ79XkW9lE=; b=niAkMXbaOeqko1zo/eei7oBdn7
	j86qvsPeMy8vXnmoXB08a90a+luOPEJbo/qZz4XBzFtHrrPFMlfwl71jMsLQnmJO3tuAExfxBVF2c
	JmroE2aK9lyGY1HEOw4IxkcH6pzXFnyEc3zhocav2phFfjYhUFBJvQf2rNeUaodqr9kBJZvcysLMM
	/5RGdeSJTah06bfAuw+kxmyzLpp//mFg3Q4o16O37piiOZ2bKSyMknc+fEMdrMa59x5O/fGBxdHDw
	cuAtMcWCg4dE8oaEHmKaNKtMacYqrzXGkDwJxR90ow6WlwxNy2KNpDwgCHbJuDed4Vcj4CImnwH1j
	W+87ZzXg==;
Received: from ip6-localhost ([::1]:22836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sdcbf-004Tuq-Oi; Mon, 12 Aug 2024 21:29:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29418) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdcba-004Tuj-PV
 for samba-technical@lists.samba.org; Mon, 12 Aug 2024 21:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=jLRcwOz+XjdQ8VNc7x+LXqcsVnDyKa4YGUQ79XkW9lE=; b=uqjbrFXqXkh6rDd/cnpJeaCTGJ
 L7iewud157ocAGHWXxH7Gi7VYd7YN1EilL5FuH91qwC5+e+U9H+NSWYif0TCUXwgam+JpngrvG8iW
 AlsChqBSzKNsfOPk/8F299kq+t1idkkwjHcPdVLHiwV9DCER2iHQJL4JlYFKa9V/DJyuPHFxUwLqR
 4FAAo+xvHaETdPorYcO9+nvbqIP9j9G/870mVjU4nLhJ0PYwXgmAYswdpUQR7z5Emtw4/Q/yreGRH
 Oj+mjwYXysxUrt87VaIhUwBQzOHPJXX0/Y1uSBjjoyPeVTWjxihEZALquE6qDriBwWLXh21XuYHyp
 H64+eUXHQlW12PojFIcPzlqlDijEYxOHv7m+HUBKamuxEb5a1Kd6V2sHcqtpq2rwDyXX3Pj6VW3L0
 +sgdRsoxDmgcEP2rJsVie1DDHNIrea9lyYA+W24ODZCRlXge9m2sXx0veO5YTDAA0w4l/12Oze4fE
 qTHKJHL42/js61ps0bfJx+3e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdcbZ-0067SY-2r for samba-technical@lists.samba.org;
 Mon, 12 Aug 2024 21:29:30 +0000
Message-ID: <37323893-503b-455c-beb6-fede11a44eb9@samba.org>
Date: Mon, 12 Aug 2024 15:29:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: CI can't reach internet to fetch rust packages
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm getting this failure when doing a `cargo test` via samba test in CI:

     Updating crates.io index
warning: spurious network error (3 tries remaining): [7] Couldn't 
connect to server (Failed to connect to index.crates.io port 443 after 
42 ms: Couldn't connect to server)
warning: spurious network error (2 tries remaining): [7] Couldn't 
connect to server (Failed to connect to index.crates.io port 443 after 0 
ms: Couldn't connect to server)
warning: spurious network error (1 tries remaining): [7] Couldn't 
connect to server (Failed to connect to index.crates.io port 443 after 0 
ms: Couldn't connect to server)
error: failed to get `libc` as a dependency of package `config v4.21.0 
(/builds/samba-testbase/samba-o3/rust/config)`

Caused by:
   download of config.json failed

Caused by:
   failed to download from `https://index.crates.io/config.json`

Caused by:
   [7] Couldn't connect to server (Failed to connect to index.crates.io 
port 443 after 0 ms: Couldn't connect to server)

Doing `cargo build` during the build phase does not fail to download 
dependencies. Any one know what's causing this?

https://gitlab.com/samba-team/devel/samba/-/jobs/7566611520

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


