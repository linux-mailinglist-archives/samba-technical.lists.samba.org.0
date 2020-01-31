Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300A14E6D8
	for <lists+samba-technical@lfdr.de>; Fri, 31 Jan 2020 02:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/1see1y4ghfNC84lhvi47DsqkfdDo+RgxBXXF8MOqQY=; b=oZhUpCsJcYWP2sZzkZSw3uMcvk
	yUAiFr7TaJyTSHpFHvJDsk1zW0UZBywkDmaA3L+uc5/gEQyunsuKdjlCb8VqqLkHdbazKkiJuRnCb
	c6WHqUaM3ooESsbNj4wqKkPtwldgVJMMzNQ5U9RpWeJ7WEgNYGdZL6QfZgn9Mg0Ettx/MJXHGPqaE
	rDaPEnhCptW+wvj82JFTVazwVnrJUiMBNh+WS8NT8PDnj47KYE7lMplWWS5dpYr50AsbGX49dXF+j
	XtrBf3SbXjCZBamRrMzWhcv4jHXHAdWzBB9sBMDhzVCHAuafrAdwzUZpzfHuXfWAlzlK3bbCvoCSx
	b3sy7i6A==;
Received: from localhost ([::1]:28752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ixLDF-005fIW-5o; Fri, 31 Jan 2020 01:35:13 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52617 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ixLD4-005fIM-Nr
 for samba-technical@lists.samba.org; Fri, 31 Jan 2020 01:35:06 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4880C00fJ1z9sRR;
 Fri, 31 Jan 2020 12:34:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1580434492; bh=yiD8/R3VCZBIlN5AWtnGa+tZDVv70PMiWhll96nfTt4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o0gYV4eYjB5OvsEohjautaiEeO96YIdlNBHRjimvHfXWZ/HW2AQemednYqkxIA055
 g+0w27xiycL1Q2uyOp/H+93ggVyqmlpSoFyGktwFVa4UeBDwIkKBv7yHQLhcRynFdG
 aYzX+Wu8fbfNV+dDenYuE3fv0vTtKLslwKgsxEPZ2Bkbkp0szbjVqzVc1WdwcNimoG
 DCsU/fGhS7biCc/YeiDwMUtAeq5zBLh5Ddtw9lo38mr1MIRD1MSUA1usPcQNiUAK2p
 nj2WlADpA8m4JyikzSmkhmOXIlSVkff1tu8rNMzfuR9RBHSTICu6mfnHLzjLJmA92g
 mVWua83e31FTQ==
Date: Fri, 31 Jan 2020 12:34:50 +1100
To: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Subject: Re: ctdb, haproxy, and ip_nonlocal_bind
Message-ID: <20200131123450.51bf685b@martins.ozlabs.org>
In-Reply-To: <CAGbvivJL8NFWzc0_aBYu4aUMsRdu7ZhQ=HFmE9OCGChiJ0W02A@mail.gmail.com>
References: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
 <20200130161536.271df9ca@martins.ozlabs.org>
 <CAGbvivJ4-ZPpz9iaqPT_BEuRX5qUm9E8yQ4ePYQYHydUg_vr4g@mail.gmail.com>
 <CAGbvivKRKSQhgXqO8h+DMrJYPUBDdDrzV+fKE0JUaQ5Zr02GzQ@mail.gmail.com>
 <CAGbvivJL8NFWzc0_aBYu4aUMsRdu7ZhQ=HFmE9OCGChiJ0W02A@mail.gmail.com>
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

On Thu, 30 Jan 2020 10:34:11 -0500, Wyllys Ingersoll
<wyllys.ingersoll@keepertech.com> wrote:

> Follow up - got it working.
> 
> The problem I was having was that the ordering of the IP addresses in the
> "nodes" file was different on each of the nodes.  I didn't think that the
> ordering would matter if I had specified "node address" in the ctdb.conf
> [global] config section, but apparently it's important.

Yeah, I just confirmed that this is documented int he ctdb(7) man page
and https://wiki.samba.org/index.php/Basic_CTDB_configuration#nodes_file
so I'm happy... :-)

> Now both nodes are in OK status and I can mount shares through an IP
> address managed by haproxy.
> 
> Thanks for the help!

Excellent to hear!

peace & happiness,
martin

