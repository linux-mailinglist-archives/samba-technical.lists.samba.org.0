Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62830FAD02
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 10:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hLKJ3b1kdqYT/8w85hjHmRIjPFrz9LdwuZUtQSIwcAE=; b=KIeET2cU+Eqnqh8NcvUorywCQW
	Zv7QJLEDTLWTHLQPENGEMSo6Z1WN+UsL0z49d+9kEyvIskhKKEOAJq73LJ+SzwyIiqKpoW30RCvRS
	u0eNyvPPpx3QFfPvpaFZfMsz6M2AVPoATNWtZu2Rw2jvbhgjf+Eixl1IEoQ8eIUUCUCOWeCDmfddc
	rs6BYNv3wjoCUuAc8sLBki/TLNgOLeWcwjAm6K0oWefgaGgqt+72OiF+sTlkCBT2YLSQxLh7sdPSz
	LAf/LpXSnaChyYhJxOsp08W5ylqvvTfIiHju1kyAPJ2iRNFa0VwaNJsorAqZKHNHnVMjxw5PM0TJx
	f6AiYCvw==;
Received: from localhost ([::1]:52390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUp0P-0003Lz-7o; Wed, 13 Nov 2019 09:32:05 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49549 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUp0K-0003Ls-Lj
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 09:32:03 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CfWn6P1jz9s7T;
 Wed, 13 Nov 2019 20:31:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1573637510; bh=+wuRH+OQrF8SbpbjgA9Z1aMQPnst1OWWKJP2ul15JXs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tH8GZaLZpXEHJLcIbMMN6mD2IMShnf08LNEBqHykloDMfi4ip0nQAEuW7INc0KhNN
 r5uPloHTn0uOCPdsREyTMQvXaGvnCo4YyQqgfw92KvpRozCQ6/wia7ve0RFPsw+cha
 uv5/Of3Ug16Uf+jiookDjKBPOfUjQGREjFJoFf/L64zLNn6jq4MOL80CnaCumZpnZm
 OCijs4Sb3SNvmVt5XZ+HMLsdJgdgENJHuIJTrH6YcYfZMN6metGge6rahbrFRUt8VQ
 ZFoc6LLb1hXivPeCSvFfL1LDs/myrRs77Qh2KxtuajmhXMAQuQP8VlCM7uu+PoQCHs
 Hb+kGJ5UIuSnQ==
Date: Wed, 13 Nov 2019 20:31:48 +1100
To: Amitay Isaacs <amitay@gmail.com>
Subject: Re: [PATCH] ctdb-ib: Fix build errors for infiniband transport
Message-ID: <20191113203148.2ac36c92@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mTKrDNj7hgcKNpf=8ibwtJ7VjhrOLbyjgJ+Orj9R6aR0A@mail.gmail.com>
References: <CAJ+X7mTKrDNj7hgcKNpf=8ibwtJ7VjhrOLbyjgJ+Orj9R6aR0A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 13 Nov 2019 17:20:07 +1100, Amitay Isaacs via samba-technical
<samba-technical@lists.samba.org> wrote:

> Even though infiniband support is broken in CTDB, I would like to keep
> it building at least.
> 
> Please review and push.

Reviewed-by: Martin Schwenke <martin@meltin.net>

Pushed...

peace & happiness,
martin

