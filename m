Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 825784C41A7
	for <lists+samba-technical@lfdr.de>; Fri, 25 Feb 2022 10:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=XzE5+FaI4LHUFPTVQTCDGqbdJ8yTxL6Ixl142vcqPos=; b=VuR8wF/Eb0PvsGfNZPS24svCb1
	S6Ly0qWlySEmi3sLs+xG6vVIEElVgNXZ/S2qly3fv3eTIrh+5z7ZDnraeJPRvQyWryRkoYO+IBWD1
	NWA/LS69K9oyFBL/vdHjGwfwnTVz9+y9M2uOLJShhMNzrbpK/JTO3GKWkU/HuvLb9prjxPArAMZz5
	OoJTfgreBa5JLv3OVhFAC69LkezE8KfqBF9VIVzOfgvqZvGIQrT54YqomZIfsJpJ6VtlNwJuR+MNg
	xUBaNcqbf2azZDPeJoQr+tmu/m4b039ytMJB+68PVwIAKWJ8lfr0WLo0qru1kVBWZjlotvJ29sEsa
	CjN3KFKA==;
Received: from ip6-localhost ([::1]:47826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNX69-00Bd7J-Cp; Fri, 25 Feb 2022 09:41:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNX63-00Bd79-Px
 for samba-technical@lists.samba.org; Fri, 25 Feb 2022 09:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=XzE5+FaI4LHUFPTVQTCDGqbdJ8yTxL6Ixl142vcqPos=; b=EGTVIUGz+VQU9Cp+On4xWx6M9+
 bC2Sb20gomteTuJW+j5pXlK6QEOUnHkBPZw76a3rutGuT4Hdn3EiOslVr8KhlajhlSm1EPx8enCAJ
 DVjRMCAF6hkv+MNnneWRqcGqzxke3chqUatk4yAFEfVCv0VjKY0WI5x56iR+PeTswxSQULH6l6dkT
 RmXpCS1vi1fZiUiEzd25loMuy+IHsmvrunhXHX0wURxmNG/kLglsJC4TvIjRS2zV7W4vc0OGPtAuU
 CIL2NPHq7+YSIxRg+UtxSxleuFfVhaV3dQ9eIL3gutwD32DHEtxUjZbSCXno4lCXVhX1+L7jLob7e
 3B8sBecTmLxZGFYt4HlEleGPKeJilR6rAjoGkJqP6dDPt3R4e1Fq/RNiI3EDRX3TpHORsq1eIlE0d
 acT5J4M3+SiD6a8nYOVkklcx7mFC/a/afVrW3nXVhS6++YRPJy11ApX1pFsIcmQGpqVC2AJ3zHbuk
 P/ZpKitsERs6trZwlw/DBrNZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nNX62-005RLY-Dc; Fri, 25 Feb 2022 09:41:06 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Samba | Bronze bit,
 S4U and RBCD support with MIT Kerberos 1.20 (!2330)
Date: Fri, 25 Feb 2022 10:41:04 +0100
Message-ID: <2427635.MdZvMZBkg4@magrathea>
In-Reply-To: <23462492d1a7b61ee1c40313445f737296421f2a.camel@samba.org>
References: <reply-4ecf65ee6e5c0adbf25c57ec268d6f8e@gitlab.com>
 <note_855084458@gitlab.com>
 <23462492d1a7b61ee1c40313445f737296421f2a.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, February 25, 2022 9:48:52 AM CET Andrew Bartlett via samba-
technical wrote:
> I think this is a discussion worth having somewhere a little less
> hidden than a MR.  So sent to Samba-technical, but BCC to the MR.  Lets
> see if that works...
> 
> On https://gitlab.com/samba-team/samba/-/merge_requests/2330#note_855084458
> Andreas, Alexander and I are caught on the philosophical point of what
> MIT krb5 versions we should be including runtime support for in master.
> 
> My point is that we test MIT 1.20 on Fedora.  The non-Fedora builds all
> build Heimdal.  That is, with these changes the MIT 1.19 support is
> untested in our CI, so we shouldn't put untested code in such important
> codepaths.

This is not true!

Take a look at the pipeline:

https://gitlab.com/samba-team/devel/samba/-/pipelines/478777772

samba-addc-mit120 - This runner tests MIT Kerberos 1.20 (pre-release). It
                    tests the most important bits which have significantly
                    changed. Like the KDB interface, S4U and RBCD.
                    If you look at the log you can see:
    $ if [ -x "$(command -v krb5-config)" ]; then krb5-config --version; fi
    Kerberos 5 release 1.20-prerelease


samba-addc-mit-1 - This runner tests MIT Kerberos 1.19
    From the log:
    $ if [ -x "$(command -v krb5-config)" ]; then krb5-config --version; fi
    Kerberos 5 release 1.19.2

samba-addc-mit-4a - This runner tests MIT Kerberos 1.19
samba-addc-mit-4b - This runner tests MIT Kerberos 1.19
samba-admem-mit - This runner tests MIT Kerberos 1.19
samba-mitkrb5 - This runner tests MIT Kerberos 1.19

> I'm honestly not making this argument to destroy the MIT KDC effort, on
> the contrary I want it to succeed!
> 
> But for it to be a long-term success we must also be able to learn from
> the past 6 months in particular to ensure we have a viable, practised
> process for changes need to be made in both codebases.
> 
> In particular, I'm concerned that the AD DC 'will build and securely
> operate against the MIT version found on enterprise distributions' is
> just not a promise we can keep, so setting that up as the baseline
> expectation sets us up to fail.

What sense does it make to drop support for the latest MIT Kerberos release 
(version 1.19) and require our users to build MIT Kerberos from git master 
with the next Samba release?


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



