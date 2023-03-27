Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4756CB001
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 22:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xMGhwRwQHrBcJn9ymXAy7C5Lrl+M0x7eGUhAyylYQNw=; b=UuO860zjEVFqvzjjivlrm3HM0g
	ZNXdP2tFeGhdcZiETITrxiMWaL4t2Wcy3sSb2WoqkgtNiSnwa/aShlOFoyhvsXES+URz4Evj6uyKh
	X5KJbv9Q/cj28EBaeBVHMQBOL2WnInz8Hm1FYEnx8AihAeKu98VKXrwsyc3Ted5TMRmmLKIiemTvy
	kfI9bnL6a9TLcNEhfY/TUxcyeZFMkGIcdiS7yD1eCl+qtLboA3AiZYrIj8IjtiWRsSqrWP5jAAk0s
	EiZsf3yxT3TL5SXB2E1VgcAlS8S8+615dZQ1AFE8F0/qafUCOuodFUuwwfJAghKtv5bUXtBnaoLZu
	geknXKqQ==;
Received: from ip6-localhost ([::1]:27120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgtUO-004qhJ-0F; Mon, 27 Mar 2023 20:30:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgtUJ-004qhA-Ki
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 20:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=xMGhwRwQHrBcJn9ymXAy7C5Lrl+M0x7eGUhAyylYQNw=; b=c6JL74uePI5UiPF1C/E5HV5a1A
 DmH1YIVJk1KU+GaEQiFGtUNL/1w8tYzYgQPZwbQihO3hkVjyCTv9sI3uaCWrdF/SjyQZX0okO4MDj
 FJI3j5CYnRNtZKXkGGl9v4fP20PIV0AfX5If7UCUMPMik9uqTvZ1scG3ennYBWJqwcl5Ks3+x9WJ/
 7EMWn6pAWOgAAhilHE/61z5NjTTJTf8ksGUcxKADKgxmaFSBH0FCIUXQDwBzHSE4i0uJiGnXRgcmM
 goIc7kMiWJ4ZeSlmVfoGZIsE2pHbSsmAa2Hgy8Mw4UEBW4kikIz4Crk88BLbfcFRVbZbC3bqUX/A9
 +8ilyqXBXwSCyJnal4/JzaJUJPMWQyrHY74uawDW5McpjN7WNY33gDCw/6+V/oGUAWuiAl/MpvFF+
 avi+F1PRo4CYjMvgjRecPctUxEUDBbrqvCt8aqubbkk83B7D7Wkj80dU2wtWRsMq2DNOw06we/5p0
 nVav1fZBlsOPUefS3NNUBQta;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgtUH-005iAI-JL; Mon, 27 Mar 2023 20:30:42 +0000
Message-ID: <deff773cc12aeaf174b251a8b17314e92bfddc65.camel@samba.org>
Subject: Re: Joining a Windows DC to a Samba AD Domain
To: =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>, Stefan Metzmacher
 <metze@samba.org>, Ralph Boehme via samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 28 Mar 2023 09:30:34 +1300
In-Reply-To: <7b120b4e-b796-e24b-a463-2e5246dc19c2@samba.org>
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
 <7b120b4e-b796-e24b-a463-2e5246dc19c2@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-03-27 at 21:38 +0200, Björn Jacke wrote:
> On 27.03.23 20:54, Andrew Bartlett wrote:
> > It is meant to work, it just isn't typical.  Often used for
> > migrations out.
> 
> I would say it works sufficiently for migration purposes, sure, but
> not 
> for generic usage. Things that we still don't implement like
> adminCount 
> (bug 13954) and probably some other small puzzle pieces will make
> people 
> unhappy who will try to use Windows and Samba DCs side by side in 
> production.
> 
> Just my 2¢ ...
> Björn

This describes it well.  It surprised me that some folks were using
mixed domains when we didn't have Azure AD sync going, but neither did
they complain about issues. 

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




