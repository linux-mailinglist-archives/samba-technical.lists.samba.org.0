Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DDF24B0F0
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 10:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PT735x5xmEbh2HN6fkqrFr3ft6kYx5xgVbrTvF8n2Pk=; b=J/UGURkMsPNP/GSs8ZzxmkENs5
	ptcXv/9Lalg1y5sJEd1S5walBRPmtLsbphgmPKykJD4IMocw6Hxz4pfkYK/ql+EYy2G0gjotKhmCa
	nD18g1G49j9u6RcSa0IDHC49XF5Ta/pTv3NfGUCsreoKVqrbAKQnpgowBE4mDFbl1JPenrkIiJipC
	S6IzuuwoXyg2q32NBAsvPujsVCnyKZVKhwY1FhLk1JG7cBjIb3EP9oxaIzZZ9lMER8JXz0ZErmj93
	UkUcXTf800qfvDy1z3er3pFFo80XUwvXH1X0YAbX0uCv4xTn0KaLcOR4Bp2tZzOUzVTg4T3BcihvO
	+zrwq93w==;
Received: from localhost ([::1]:64268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8fnl-00EOCt-PI; Thu, 20 Aug 2020 08:20:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36994) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8fng-00EOCm-F2
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 08:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=PT735x5xmEbh2HN6fkqrFr3ft6kYx5xgVbrTvF8n2Pk=; b=ApCAZkXzc8sc4BIpA/dU9jMuNa
 yldMwLtQFsmdNHEaB0lGpmFWFJJndwPxPk2JE4///ZymPliuwlECF9fwOlrMIvbxanuLRRl1aecba
 ZZEYwxWO3T7R9Xemajmp0VvFqnFilRi8P4xUoEhCOk0mHNQN4jja015ITKyRWofC/QvehOKkkmTJF
 fPvyIlf5f/mn2+N+5vzHxHPbLTZNVLJaM3PGI6ZRSMTgV3W9bWjZCA/bPkeILoW8JzKGNVpXTTPux
 Xq/ANA9k6YhdYIl/6WTiKljsAsjbxTgp5k9R0kLz9yhiMSOwQD1wdJijaPNAIgBQMVIOcrLLaNFIC
 w8cVg/COFETzXPRtG8r98GUw1KJ3m2k3MjNIA9M0Nuk6hxXjlD0zKPn0UUIK/dBKUx3pcVOtqxGMR
 z/bAPZFaDFMrXiwNse/iEOQqZmQWFWgRFVfkBM2unGsVKUBfCXr0mEP3x8GHX8MnJLyciraCqrS5D
 PnQeVn9VobUq/ezPyL/7fvXO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8fne-0002KL-KC; Thu, 20 Aug 2020 08:19:55 +0000
Message-ID: <e64290ecfa717e4c66b9b41e7bdb64d70d8cfeaa.camel@samba.org>
Subject: Re: "auto" for Kerberos, a history
To: Stefan Metzmacher <metze@samba.org>, Rowland penny <rpenny@samba.org>, 
 samba-technical@lists.samba.org
Date: Thu, 20 Aug 2020 20:19:50 +1200
In-Reply-To: <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
 <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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

On Thu, 2020-08-20 at 08:53 +0200, Stefan Metzmacher wrote:
> Am 20.08.20 um 08:30 schrieb Rowland penny via samba-technical:
> > On 19/08/2020 23:10, Andrew Bartlett wrote:
> > > On Wed, 2020-08-19 at 22:13 +0100, Rowland penny via samba-
> > > technical
> > > wrote:
> > > >       -k KERBEROS, --kerberos=KERBEROS
> > > >                           Use Kerberos
> > > > 
> > > > If you check the code, 'KERBEROS' is actually 'yes', 'auto' or
> > > > 'no'
> > > > 
> > > > What is 'auto' in this context ? surely using kerberos is
> > > > binary,
> > > > you
> > > > either want to use it, or you don't, 'yes' or 'no', so what
> > > > does
> > > > 'auto'
> > > > actually mean and do ?
> > > > 
> > > > Do we really need 'auto', can we not decide what the parameter
> > > > defaults
> > > > (for instance) should be and remove 'auto' ?
> > > 
> > > In this context, the current code behaviour is to try and obtain
> > > a
> > > kerberos ticket, but to fall back to NTLM as 'good enough
> > > protection'
> > > if this fails, for example if no KDC can be reached, or this is
> > > an IP
> > > address, or if the server does not offer Kerberos as an
> > > authentication
> > > type.
> > > 
> > > The idea (when this was written) was to at least try Kerberos,
> > > rather
> > > than continuing to default to NTLM only.  (And on the flip side,
> > > to
> > > continue to work in the many - at the time - networks where AD
> > > was
> > > functioning only with NTLM).
> > > 
> > > Andrew Bartlett
> > > 
> > 
> > Why not just set the default to 'yes' and if this fails, fall back
> > to NTLM, this is what 'auto' seems to mean. To me, 'auto' is
> > confusing and to top it off, it doesn't seem
> > to be documented anywhere.
> 
> yes means no fallback to NTLM,
> 
> Should we use "disabled", "if_available", "required"
> instead of "no", "auto", "yes"?

I think this is a good idea, and consistent (shock!) with the smb.conf
options.  As you know we already have the following synonum table,
which covers the required backwards compatibility:

/* SMB signing types. */
static const struct enum_list enum_smb_signing_vals[] = {
        {SMB_SIGNING_DEFAULT, "default"},
        {SMB_SIGNING_OFF, "No"},
        {SMB_SIGNING_OFF, "False"},
        {SMB_SIGNING_OFF, "0"},
        {SMB_SIGNING_OFF, "Off"},
        {SMB_SIGNING_OFF, "disabled"},
        {SMB_SIGNING_IF_REQUIRED, "if_required"},
        {SMB_SIGNING_IF_REQUIRED, "Yes"},
        {SMB_SIGNING_IF_REQUIRED, "True"},
        {SMB_SIGNING_IF_REQUIRED, "1"},
        {SMB_SIGNING_IF_REQUIRED, "On"},
        {SMB_SIGNING_IF_REQUIRED, "enabled"},
        {SMB_SIGNING_IF_REQUIRED, "auto"},
        {SMB_SIGNING_DESIRED, "desired"},
        {SMB_SIGNING_REQUIRED, "required"},
        {SMB_SIGNING_REQUIRED, "mandatory"},
        {SMB_SIGNING_REQUIRED, "force"},
        {SMB_SIGNING_REQUIRED, "forced"},
        {SMB_SIGNING_REQUIRED, "enforced"},
        {-1, NULL}
};


-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




