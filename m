Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B53854FF0
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 18:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KCOZB1pgCKHgcF7IMgZGs+UNKT8m2rflfb4IGTCEyjs=; b=XZ0RcGsbIfhFFt9MB2Knx5RdBI
	KMm1w0fzjQe0IaaZKleJlLcJhk+7vjPjSwyKYkRzZc0FOwmkr5Qr6qTPHj4l0U4HLro3Ps5/2cV7P
	UkzAIOPQcnfk2lMuZs+AqTggPTtdau5mFVDEq+RKX8VJYMC3BUf+sy1qsdgvbeSrOHjkV3BIe7zSG
	MPXHKg8rzISJRQEdUap5TN3a6NOKcJMYuADMvtXwVGxDLpvEn9ewKTkeFeQBycCzsZkX6xEkmWBbz
	8HHowx5IKdI5R5pGhTzzpY/Y55KORSznbgn6hoPf/C8ue08pT6Wts0s/OGCeNPLRhqLkr/jhGC8tV
	8Jd/S6KA==;
Received: from ip6-localhost ([::1]:36962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raIxG-008TeA-I0; Wed, 14 Feb 2024 17:21:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19562) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raIxB-008Te3-I5
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 17:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=KCOZB1pgCKHgcF7IMgZGs+UNKT8m2rflfb4IGTCEyjs=; b=M9qXJDhrlVwHna5cTIhl4iTWVK
 qWm83sYPLAABmogTe+o2nPAkwx7w3hqg7cRV2cFe+A0psZ8dERwpxMdnTurxanzd0UgMQo8iN5TfY
 qD/4y8IO2mON3CFG+ojV/d0hIImNm0IsiRLvrcZWehEjjciQTRTFIqiv5XX7jwtN/wWuxIUzrqbcI
 OTimosqw9B+W/7/JOEPefqwbUqdjcjsfUfJQt+ASd3KJd4Em4JecbplY7MFgLnnIe6H7ILU3TH9DO
 4UdKrhdmKd4IEcdWkHv66jvVazCCejpnfsVT9rAVxcP0S8qA5R52pCTLB8l3RE/vuSv3Vil4DAs95
 ukkifClpu3i0coTqqCU/40wLnD+TEbXENZ4cr1uFWWGMfdJpUIPBriK6gDw+3G3a1vYCKhgnbcexP
 JSB2Q6MjdzVY7FS6EsVP301eANKRrxC0u3OlXEs9cpH1N3Y8xOB/FhOhSbYidqrTOPLEMfba3X3k/
 Dvew2TAho1LXLxZXx+0jqXFc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raIxA-00D41d-0i; Wed, 14 Feb 2024 17:21:48 +0000
Date: Wed, 14 Feb 2024 19:21:36 +0200
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Looking to once again re-bundle LDB
Message-ID: <Zcz2oHdkRyYgJK6E@toolbox>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 Michael Tokarev via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Срд, 14 лют 2024, Michael Tokarev wrote:
> 14.02.2024 17:46, Alexander Bokovoy wrote:
> ..
> > We do rebuilds of the whole stack in Fedora if bots detect samba ABI had changed. So for us it is not a problem.
> 
> It's easy to do with "current" Fedora release.  It's entirely different
> question when you want to provide current samba to a previous Fedora
> release.  And that's where the problem is, - providing "backports" of
> current samba to previous releases of distributions.

If you are building packages on top of RHEL by replacing existing
packages there, you are responsible in fixing all breakage that new
packages would introduce. It is maintenance work that one needs to
consider when providing alternative builds, regardless of a
distribution.

> For RHEL for example, some previous but still supported stable version is
> using, say, samba 4.13, and you want to run current samba 4.19 on it, -
> you'll have to either provide current sssd (rebuilt against 4.19), or a
> rebuild of whatever sssd was used on that older stable RHEL, together
> with new samba.  That's what I'm talking about.
> 
> This is probably less of an issue for RHEL though. On the samba list
> there are quite high demand on new samba for older releases of distributions.
> 
> > FreeIPA only supports MIT Kerberos for the server side and SSSD
> > provides Kerberos pre-authentication modules to MIT Kerberos soi it
> > is also best to be built against MIT version.
> 
> Yeah, it would be best to build samba against mit krb5, if it were a
> supported way.

It is supported. It just provides a bit different set of features
compared to Heimdal-enabled Samba builds. See our talk at SambaXP'23 for
details.

-- 
/ Alexander Bokovoy

