Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EDF8AB3D4
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 18:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3Wkhrr08905LBJQuA2p6CC2d4NwSOTYcOSg+PuulNiw=; b=t8AicV2I3iGIlBIJBAC5kWbfJQ
	xTdN9fv64R0lwsVed5TWzvtX/72hyPhym2SoqnlZ30OKEENf1JaKSZ3tp10Qadu3uRFmxh6SM3g3V
	2M9wCmgkllmo0Uqe325PAx2qJlZdgb4jnEGhWlDVqaTFHTFoX6vwGWyZ7EI3PI/b2WfdcHkuEJE8N
	4XcM6Wm9mvt9EuSYIsYZKTFR3/mVGD9RJR3BLCvyeyHSLxweDwYXChajIXL1Zfy34gJlTFFovtVDf
	/1CATqnJ5OY/yK4LU+Av/nMGJvfF6G9mXD4wvgV7JUffc+5uTzcJWJbcecAfVRxfJJOOnUaNwt9NH
	fVymgnSg==;
Received: from ip6-localhost ([::1]:44264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxrWG-005D5q-E6; Fri, 19 Apr 2024 16:55:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63716) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrW8-005D5j-4l
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 16:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3Wkhrr08905LBJQuA2p6CC2d4NwSOTYcOSg+PuulNiw=; b=1Gi3dI6LyP8Bj/gxxkUa5b6cZo
 16pxq2S1m1M/DFjR+dt6aa/U6/LbVIqelYJkVJUzoam6JQYMg+f/cYMsJgaOO50frwMRs6qqM7Kkx
 sqEM4D3NaNktvyGkzCev1ob6Q5fpTir/ch35tdgWN+odPfKS0aUZu0guRVk26llz6Tbzxtd2txKnp
 gaCp/og6eK1bObDuZucv9ctRklLAFtVjC4LabIBtoOxUV7TDk25XgFkmwfuAz9QJR8k8xioqHQqbY
 x7TlwrBEZ0wSiF5XEj5aLfcIiQt6x6hF89Necnm82QPfy/AxKeh8iRIZH0wxfWTXMIY4OL77C7N+f
 zKvlQ+JXfbN2cjeX5RKJVH4UK9H98dRnPYpVM9rFV9sTexoeTzhc/TKsbvTtw7kJjBNjqcqmrxPyv
 KrMdu6yo0F7QfhXquEA8b69eySpraaEhwmvsm89pzceeK59G6205QtdDiR2fVGl3wqhygn4gBJZPq
 eHgjU2KVRmpTiOuWlfVmMOcm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrW4-007I0L-0K; Fri, 19 Apr 2024 16:55:13 +0000
Date: Fri, 19 Apr 2024 09:55:09 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Missing protocol features that could help Linux
Message-ID: <ZiKh7cYq5/Z7zwNj@jeremy-HP-Z840-Workstation>
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
 <e69bad72-9139-4b01-afe5-5d34edc077a1@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e69bad72-9139-4b01-afe5-5d34edc077a1@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 19, 2024 at 06:53:01PM +0200, Ralph Boehme wrote:
>On 4/18/24 22:21, Steve French via samba-technical wrote:
>>Was following up on a recent question about support for Linux features
>>that are missing that could help us pass more xfstests
>>
>>Looking at the standard fstests for Linux (xfstests that are skipped
>>or fail for cifs.ko) to find 'features' that would help, perhaps
>>extending the current POSIX Extensions or adding a couple of SMB3.1.1
>>FSCTLs, I spotted a few obvious ones:
>>
>>  1) renameat2 (RENAME_EXCHANGE) and renameat2(WHITEOUT)  2) FITRIM
>>support 3) trusted namespace (perhaps xattr/EA extension) 4) attr
>>namespace 5) deduplication 6) chattr -i 7) unshare (namespace command)
>>8) delayed allocation 9) dax 10) attr namespace security 11) fstrim
>>12) chattr +s 13) exchange range
>>
>>Any thoughts on which of these which would be 'easy' for samba and/or
>>ksmbd server to implement (e.g. as new fsctls)?
>
>well, I guess none of these will be really "easy".
>
>Iirc when I last brough up file attributes, we vetted towards 
>postponing this kind of stuff until we have full support for the core 
>SMB3 POSIX features in Samba. Iirc the only real thing missing there 
>is symlink/reparse point handling and for that we need to settle on 
>which reparse type to use (WSL vs NFS) as discussed yesterday. It 
>would be a *huge* help Steve, if you can pursue this internally, this 
>has been a blocker for the whole project since quite some time...

renameat2 (RENAME_EXCHANGE) and renameat2(WHITEOUT) need to be
mapped into Windows SMB3 operations. We should not (IMHO) add new
SMB3 operation semantics into POSIX that overlap existing Windows
SMB3 operations.

