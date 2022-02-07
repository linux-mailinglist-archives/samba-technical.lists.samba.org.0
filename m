Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE74AC6BF
	for <lists+samba-technical@lfdr.de>; Mon,  7 Feb 2022 18:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Lrgrct5d6UXaWdakKeIFck51kbLLjHDla9ZVrHn1Hng=; b=j0+ZjDeHGn8KlDHRj1B9dJ8f6t
	BqRTBJm3ZsHU8D1bqlh0GKNzjZ0dM6C7l5uWDqExM+HdGIOKFBLykPjtWnhQtZZW0xSgnLI92YI10
	4rdbZqB/7iY0ndz8QorlbKzVd3LmdYu7K+ycdeHnTcwFb9TbtjERt+rJm4p2UBOkMU6KGPwxWK3VA
	G/RvaC7m+LQy6FQw8AtNCGjDt8aL20wSyShd8ebIp2jcEKcivEidFKi+VCma5oNtu1ukpjYUUP6X0
	48RIRg5Eg2ktx2Tx6MM2jmoE/tnGOMzr0p3/jfb5r8U9yvova6XPwQ/4npUwh9Mxv6MAZhteWDtf6
	gnFAX6qQ==;
Received: from ip6-localhost ([::1]:36388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nH7TO-005PlO-M0; Mon, 07 Feb 2022 17:06:42 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:53589) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nH7TJ-005PlA-B5; Mon, 07 Feb 2022 17:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lrgrct5d6UXaWdakKeIFck51kbLLjHDla9ZVrHn1Hng=; b=TX31rYajUoSvGJjNM0NWbp1v1x
 ZOFcvKbKh+GxIE1MREBK3IulbxVAs8SrotkBAv/Hy31a8EWlBXs5wAhqNn3ikKRjY+ad7SEHBo4Qu
 8vfPmLrqmBTso9F6+roSBjn0nRu7t7LvUoOGefUGHSXqczwhnhgMEVH2uxBnTuqyl3/P7KSkTgNxo
 y1Q/x0z5HYV4CPF0ou8zppcLA/KaBzd2A0JKtUHd7ppRZtnt7KBIj7OjEf708QSBhaYAQIVn3GPM/
 nbRRnWt6OxEIhqadU2Ej7ilJkzcI/UlrdPhj7Af3OYsPqBb/edyAYUUY/kucRIhAHKzAk5VomvZ9L
 UI02uVQg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lrgrct5d6UXaWdakKeIFck51kbLLjHDla9ZVrHn1Hng=; b=aS3IfmV1FqYSUX4pUL7ZlIwUC2
 Are5iC4jxwz/4CQG5zDMJ+dB1r1/d3eL+SMblwK+RCXR3WCoaw0pzo3z5dBA==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1nH7TH-0006B2-LW; Mon, 07 Feb 2022 18:06:35 +0100
Received: by intern.sernet.de
 id 1nH7TH-0006AF-J1; Mon, 07 Feb 2022 18:06:35 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1nH7TH-0054n3-0y; Mon, 07 Feb 2022 18:06:35 +0100
Date: Mon, 7 Feb 2022 18:06:34 +0100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Message-ID: <20220207170634.GC1203621@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Jeremy Allison <jra@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <20220126115058.GA936420@sernet.de> <YfF8+OMLV0UkzicQ@jeremy-acer>
 <9df52f1eb4b6dbda5bc6c63718c28793124c7c98.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9df52f1eb4b6dbda5bc6c63718c28793124c7c98.camel@samba.org>
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
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2022-01-27 at 07:00 +1300 Andrew Bartlett via samba-technical sent off:
> No, you got my meaning perfectly.  Even for Win9X there is, from
> memory, some strange update to make it do 'raw NTLMv2', instead of LM.
> 
> I really think we should be able to ditch this, ideally across the
> codebase but certainly in the AD DC, in 2022.

okay, with the AD DC I agree, I think we can remove it there.

For local SAM's users I would vote to keep LM hashes supported until we ditch
SMB1 anyway in the not so far future. There are really still people relying on
this.

Björn
-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mail: kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen & Reinhild Jung
AG Göttingen: HR-B 2816 - https://samba.plus/


