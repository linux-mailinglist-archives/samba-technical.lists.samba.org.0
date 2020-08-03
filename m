Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D31923B0D9
	for <lists+samba-technical@lfdr.de>; Tue,  4 Aug 2020 01:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4GEGV9my2d535INGenumTNRqy7XQ5TNPpTOHAeFeQqc=; b=f6cL7GapFk7bJwzkfQ4N2VxVbm
	ESbeoE7EOIOzmvzXtGiqml6n7y1At1A33DsAK/qhcSklAVlXCGyzQhQx7ypmKYa1R9ZV6GAFVuuGp
	Oh8BN3EEW+vrUBUM4A8sM2INsJXAaW1Z7QJna9Ro8w6K0AL7LYMjNmqbK37ejL4tNpMF+jDFE+GUf
	MFzsDXsyqYZTPHwMz+9LAWbyJ5X2u9R/OHIJTXEPLpsFvRP/Lt5U3G3WlU+/2teEzD8SAz6LQoi89
	sU7HeDNR1+dPRMSTxW4P7pEsVAzpPNH6ivRR9zZGR9zhqxKFzWQxc0fs+QfhtfkyqT4Y/ka2OkKWl
	CtYueZwQ==;
Received: from localhost ([::1]:26346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2jkG-00CNzM-5O; Mon, 03 Aug 2020 23:19:52 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:45111 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2jkA-00CNzF-1C
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 23:19:49 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLDP44QXsz9sTK;
 Tue,  4 Aug 2020 09:19:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1596496776; bh=jSFV7+ilF+AUr7OPerNgRkxdiioWP/XdcN+vPNTxYjE=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=PUOzDBcutCEostbMuWBH2AjUCNz8MPU652X91SIrPuKwIzDjYRf3VK7Su4s5cccn7
 QDbDk12tRH7HrUsnL5HL5KAnTpXrstgLsl+3gNzzro07ChzC7DIvLmStSMdUBuea6g
 rdEvYFD5tyjONPqbVJDv9IxXXmvzIMpNdoUko7e5NA6QZ+L9tUr4czPxY5EbqljTUQ
 htGn2tgZl55G1iuEHyi+7GlTwB+tOICMVEj8+9B5eqgdt+eMSe00ESK4wf/Dl9Jt0j
 1fM24QUdBu1j37m1QZEscgX1wESyWetF/06URYUbN+zeKRb5fImAPLQg1qVYPLUmni
 U8UtB+fWql5Bw==
Date: Tue, 4 Aug 2020 09:19:34 +1000
To: samba-technical@lists.samba.org
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <20200804091934.70762add@martins.ozlabs.org>
In-Reply-To: <20200803222205.48A4714022B@sn.samba.org>
References: <20200803222205.48A4714022B@sn.samba.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon,  3 Aug 2020 22:22:04 +0000 (UTC), Jeremy Allison
<jra@samba.org> wrote:

> diff --git a/lib/util/smb_strtox.c b/lib/util/smb_strtox.c
> new file mode 100644
> index 00000000000..2cace8b9aaf
> --- /dev/null
> +++ b/lib/util/smb_strtox.c
> @@ -0,0 +1,177 @@
> +/*
> + * Unix SMB/CIFS implementation.
> + *
> + * Copyright (C) Swen Schillig 2019
> + *
> + *   ** NOTE! The following LGPL license applies to the tevent
> + *   ** library. This does NOT imply that all of Samba is released
> + *   ** under the LGPL
> + *
> [...]

"tevent"  :-(

peace & happiness,
martin

