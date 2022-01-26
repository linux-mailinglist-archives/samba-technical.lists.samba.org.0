Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A509849C915
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 12:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1hjJNz/uH0W2SYfGTyC4s5CrJiXr8sQX8A+XNM4U+Ag=; b=Vq7G74rlrlBAZCKG+hq2MfXVGX
	iQO645AXiaCNDHbs/8PFnOtSaZOQUqz9WDQ0x9/5d7mudPZZ/WindQGHURusd0wmcNM82CVGw6Yv7
	jmotycpoFL4/cPWee2F/gkN77TvaKWZ4AeUi6B6Jw0ltv4tjOeBkjLqtauTCSJtsImMX49SFTWK4t
	tkzKUM02fUTuCxv4ig1AcmVJgC+p80Mu65e5bulzf+KiQa8i1FEv8AgTjTfMiBt7hiM+HRSLNIIkn
	xxgW5Cg9hRqhJw8SnDk9dnwBpHs3FHRDDIAsp6KvL4LbyJ88uHDoEj/gLxWFyTdF/IIFquRPulXOI
	WJDMGKYw==;
Received: from ip6-localhost ([::1]:25764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCgpP-000s3A-Io; Wed, 26 Jan 2022 11:51:07 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:47633) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCgpI-000s2w-8i; Wed, 26 Jan 2022 11:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hjJNz/uH0W2SYfGTyC4s5CrJiXr8sQX8A+XNM4U+Ag=; b=DiUrQ/2X+Ts03bpcluYLcG3/4Q
 ZWbi7zJjDsiMUwvyb1HRezmDutu56K3IZEQ2vQ0y9v1fqaQw5mq2afDJxOf9r9D6b5+YDDbs9LZne
 VwQZxo8kSmqEaSM8mc90/NRKT86NWYCu7DWr60ZnSUcQdFfox+WKZ8h/QQOGLQETaUPEUxiDEeXFk
 LwjA+pah1WZY5jyjqkXuFD2B8m1fcpSeami+bY/TO0LmTKkR3CWOlrH4SXMPqBvoVcdJhn7Qb2ql5
 aja0JJssgQ1MX63FtfncPHXcCBtoJpiWIVtIdQybl5Qc30o7hwFIAsfrHv9yDbwH8vf8dmFY0likB
 jCQDIgFQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hjJNz/uH0W2SYfGTyC4s5CrJiXr8sQX8A+XNM4U+Ag=; b=qOGSLeBbSjZB29/MNfFmnsUfjS
 WVn81VnqtxuSxRmv9c5asSdi86hYJUC3VzOZH6JXp3VLjwwR43oVMukTeYAQ==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1nCgpH-000833-EN; Wed, 26 Jan 2022 12:50:59 +0100
Received: by intern.sernet.de
 id 1nCgpH-0000Ul-Bu; Wed, 26 Jan 2022 12:50:59 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1nCgpG-003xeH-T2; Wed, 26 Jan 2022 12:50:58 +0100
Date: Wed, 26 Jan 2022 12:50:58 +0100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Message-ID: <20220126115058.GA936420@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bjacke@SerNet.DE>
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2022-01-26 at 16:50 +1300 Andrew Bartlett via samba sent off:
> My feeling is that for the Win9X and OS/2 irrilplacable industrial
> equipment case, that guest authentication would suffice, combined with
> 'force user' and 'hosts allow' for 'security'.
> 
> What do folks think?

my gut feeling is that many users will be very unhappy with such a change. I
know many setups where the clients say that ntlm auth is still required for
them and where guest auth would not be an option. Even on AD DCs sometimes. For
sure on member servers.

Best regards
Björn
-- 
SerNet GmbH - Bahnhofsallee 1b - 37081 Göttingen
phone: +495513700000  mailto:contact@sernet.com
AG Göttingen: HR-B 2816 - https://www.sernet.com
Manag. Directors Johannes Loxen and Reinhild Jung
data privacy policy https://www.sernet.de/privacy

