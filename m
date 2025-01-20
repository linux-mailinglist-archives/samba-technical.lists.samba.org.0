Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F0A1668E
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2025 07:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7k2jWqqVBTbWBoxweBV+KFIurg6JtV/uUEaitKlWe4Q=; b=yJD+JZItb6Ognb8yVteBrhLlNG
	j2TRLFrVxryZiLBxN+r8gsHsnZx6/CLsq/yq+Vi1ABfh/UPHAGNic+6E5JRNkJ9AQg2r6/fqWwJg9
	MIFM2Uywy4PYKwKmMicaqmCzHvRylyeAIf88/d8nPggJ9jMJfHvjKdSKrNXguKH68zdA8zsEcVK+2
	wtlbDVqLddVKPG9wAoaK899jsDC1NEEylRPYruZQy6LLGilebSDwlnYTLLs2H9B6X+1MG+Od0DmH5
	eixo/FwWyvvbaXVVbI7ZTz8FSRChUIy6uVVPHi8WsqPCFtrjEZqAvuBDjkFnRsF/K892lxKWloopc
	r6Q5gGkA==;
Received: from ip6-localhost ([::1]:48164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tZl0d-008gtW-Ol; Mon, 20 Jan 2025 06:11:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22728) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZl0Z-008gtP-3p
 for samba-technical@lists.samba.org; Mon, 20 Jan 2025 06:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7k2jWqqVBTbWBoxweBV+KFIurg6JtV/uUEaitKlWe4Q=; b=NAkxOfPvPDLYK4MdcsojkoxUd6
 L2v40c7B4Ti4dL1qG1JZd+PsO/iV6vcy8mTRdL2JvxAfNfOxGEQvpKW5JlfMXGi6T/ZZl29BIY8tD
 04TFzNxzHtL2V5eQVTCzP2nocjMGPM4GNQ5ZH57UjZrqBfIQk0MxJNziX+nzNoiLrL6LS1V6snl8c
 C4ARSiDjLJ16DfC+6jZ+cjawphjOQPpb9+FDTritjRlSueNhOkFpOQ51gLh5LmziB+n8JVSvcrJdO
 Pz7GVA76HCZbSEWUuP7/BI8ZlQ5Yh2Yyappcjdy1nIdENOllIUi+nfS0ChJu+GUFXeHIauEHzlfde
 kx2Vb77VIjbhcUtWQWiKwpjCsBwKFuy4VoyF9type4gFpO8xPHgNupv+uQhrNr3XuTTqMXHLS/Cfp
 x5M91iVp4OtHYk9x5gE3JQunSzspZ/9GPttN3tjNZj3CLaXdlfNxcmb0M8d31Q8iv2Nj1p5lQGDcF
 hniEViKgSKJXQwaPi7mDKfmH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZl0Y-000yKg-12; Mon, 20 Jan 2025 06:11:34 +0000
Date: Mon, 20 Jan 2025 08:11:30 +0200
To: Steve French <smfrench@gmail.com>
Subject: Re: Local KDC and Samba
Message-ID: <Z43pEk7WDs6dTQ1M@toolbox>
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Няд, 19 сту 2025, Steve French wrote:
> Is there documentation (or example howto, walkthrough etc.) on how to
> setup the new Local KDC features of Samba server?
> 
> I wanted to try some experiments with the Linux client to make sure
> the new type of krb5 mounts work fine.  For the server I am using
> current Samba master branch on Ubuntu.

There are bits and pieces which aren't merged yet in both MIT Kerberos
and Samba.

Your best way of testing is by using COPR repository Andreas created for
Fedora as it includes prepared packages.

See https://gitlab.com/cryptomilk/localkdc and https://copr.fedorainfracloud.org/coprs/asn/localkdc/

Andreas gave some insstructions in this comment:
https://github.com/SSSD/sssd/issues/7723#issuecomment-2597864370


-- 
/ Alexander Bokovoy

