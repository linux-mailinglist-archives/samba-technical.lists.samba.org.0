Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0D7D39206
	for <lists+samba-technical@lfdr.de>; Sun, 18 Jan 2026 02:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DHmgiguLXt9qYcaUsp9RWli8oz4FyT8NQdHP0o9QhFI=; b=gMYaW8L7wTpB6uWAW1jUmOn1tH
	G9/EiZUTC+Qjn+SD5V4bXvZWyV4RgrCutmZGqkgWeDw7Tv5Y7auZi/1MGBP87zHwln57RjZ9lAEcD
	p0sJlQmsHJ48YmdRm4ZXfSIg7vUdH/ZZT1c778pqsFUmK4yo4hHsRhAoG8H62lolSJpgPR+P70fzx
	c1XTIySeZtgwCStESA+wdBPUEBRb7YDdsPP+B7+suPn0gfuu34lliOIa/OcKLfz5RvuIMoH40W2U3
	WcJEh9kKOgA+OXk/PDvWCu5uF3BhFKvHmUMXueZNtfOkCQl2CjB/yxgejx/H3hJyp891vuvBHbUg+
	KGuYFVeg==;
Received: from ip6-localhost ([::1]:62214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vhHOr-000RUV-3N; Sun, 18 Jan 2026 01:16:17 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155]:41127) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhHOk-000RUL-Rp
 for samba-technical@lists.samba.org; Sun, 18 Jan 2026 01:16:14 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 516A07A03D6
 for <samba-technical@lists.samba.org>; Sat, 17 Jan 2026 19:51:21 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-02.internal (MEProxy); Sat, 17 Jan 2026 19:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sjorsgielen.nl;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
 t=1768697481; x=1768783881; bh=YkjJZGJCCIaQBAeAXCzM6r9Lw0j900gF
 cefHU/UO4BE=; b=XogPVmmQoUho078xpTLjOjniYIeeR80bt/CIp0Zq6Q1GQD1j
 vZKfGs9AOyzd/iOopiI5GGeD4/N+JpxYsYWoGS+wx/ryv2Wf57bZhYGE8k5IDuq2
 jVbtMw8/YTPbPZ/A+LKfPRTPvpGUjx7sYWdyhIpcbIvWwoc3bYdH8+ws7B3gpnJ/
 nVbMPokDf9QcN/O1ccHRVcJlpY+/PZ+SdE7BccauLVNwnQoB1LMQRBdTplxLvqXw
 eTpkI5pfFgZhnjnBpSLHL29c9CngrbassQj39Iwq12d9KsqpYAfnDHYaAcUujDDf
 ez5P42iyyIquCNvLYIOYuv2C2q1vTCbitm9Tag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768697481; x=
 1768783881; bh=YkjJZGJCCIaQBAeAXCzM6r9Lw0j900gFcefHU/UO4BE=; b=x
 kZlJTEcuAJK5sCEQsI8qLmC6bWn6iqqjO2v6rk0rWvH036aKOLudM4TLXQKUoFA1
 tLxNXiQykzM5qtBsgtYm8csdDKiYJMBtWHlBUFVwUcdmjo0UdkgveQ0nMt39zFIg
 WJv8jcqXJ0ClDBxcU+vBC6xFFLlbWPtwOS7TVPvi8uavyFdJrxXz9pKgUYKFz0c7
 hgkKUXlqJynW82IEeULDmaCiL/89+PTRe4NGCN7vWLBODPXHyj0EQnuOHwhTTYkf
 AE9nkdU9Tl3wTvXv6/hXfeKG1yQlWua+S8X9bnUAKldVXyLXV6g9usAbrXpJx8hp
 mJUkZiqC1xqhQeuji0hZw==
X-ME-Sender: <xms:iC5saXJDz9ue2qZIm8xArTP3hkQK1Va-I4JFBIQ6ocZGG0G6AIgbNA>
 <xme:iC5saV_3frL3Hn-zLKZN82q3snbNTcnaoe564vyD3XJ4FpG3uwmesII2hatF4wXEq
 zeqAamGZ7PkVHo3bafF7UpwTLz7oLlblB2QLrtO35-wt8ntb2MfKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeefvdelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgesrgdtreerredttd
 enucfhrhhomhepfdfujhhorhhsucfiihgvlhgvnhdfuceoshgrmhgsrgesshhjohhrshhg
 ihgvlhgvnhdrnhhlqeenucggtffrrghtthgvrhhnpefhhefftddtffeuleejvdejhefgle
 dvgedvhfevgfegvedvtedtffdtffefuedthfenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmsggrsehsjhhorhhsghhivghlvghnrdhnlh
 dpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgr
 mhgsrgdqthgvtghhnhhitggrlheslhhishhtshdrshgrmhgsrgdrohhrgh
X-ME-Proxy: <xmx:iC5sadZ0VECGjLcziFXqAnR_7TZBpVhr1lkI6EAhls3wQUkxAHLPsw>
 <xmx:iC5saUWEq_YUgZN9GsZQFKc62LPr6BixW80apGoRzseMTUPVZquA-A>
 <xmx:iC5sac1EnoatqQk1qLVRQAoHzb2C7v-RyXYupHWs8hL24d03C-tRBw>
 <xmx:iC5saTZm2nfOimqWtytrrQj0U0ZZRQgv7QC5CUbpq6jiWC2r3z82SQ>
 <xmx:iS5saQ3_h1iyqeZ6rgO9x39iMRQF8Qsv5bsTH34OHSM9-E7EH65vXh6->
Feedback-ID: i59e146ee:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A520E2CE0078; Sat, 17 Jan 2026 19:51:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 18 Jan 2026 01:50:45 +0100
To: samba-technical@lists.samba.org
Message-Id: <7eb666e1-e653-44e4-b384-fd010fe17b4f@app.fastmail.com>
Subject: Investigating durable handle errors
Content-Type: text/plain
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
From: Sjors Gielen via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sjors Gielen <samba@sjorsgielen.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear list,

Since an upgrade to macOS Tahoe about two months ago, I've been having issues in Time Machine backups to my Samba server. I've been investigating them over the past few weeks (learning the protocol, taking pcaps, checking log messages, writing test clients and reading source code), and have upgraded to Samba 4.23.4 and improved various configurations. With this, the backups do run for a while, but eventually always seem to result in a TCP reset and subsequent failing reconnection / reopening of durable handles. The TCP resets I understand, but the failing reopening of durable handles seem to be caused by many different reasons that I'm trying to untangle and fix one by one.

One of the error messages I often see is the following:

> Failed to disconnect durable handle for file charmeleon.sparsebundle/Info.plist: NT_STATUS_NOT_SUPPORTED - proceeding with normal close

This NT_STATUS_NOT_SUPPORTED is coming from the VFS durable_disconnect function, which in my case is a Linux mounted network filesystem so it's implemented by vfs_default_durable_disconnect. In fact, through debugging I've noticed the following branch is going off:

> if (fsp->current_lock_count != 0 &&
>     (fsp_lease_type(fsp) & SMB2_LEASE_WRITE) == 0)
> {
> return NT_STATUS_NOT_SUPPORTED;
> }

Am I right in interpreting that Samba does not support disconnecting a lock if it's held by other sessions as well, but not if held for writing? What about this scenario is unsupported?

Thanks for any clarifications.

Best,
Sjors
