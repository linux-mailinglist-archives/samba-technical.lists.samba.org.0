Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3D13B55E
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 23:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZyJs6z4kB6gFjsJeULQsisaC2gCoSUdiQkbIPcASPY4=; b=n3J/5zvEfZ2Vno666skcE6GNPE
	NG7yQjZ/P25ayGV0ucHetUmurVbKaWg5iHFVY79IJWO8ppaQjHceLfCJOFmJDamRRkjeX81rXMqHA
	5pe9Pk2/QrOJ5tygXgTESNKU+wLUYhyQ7gDSUqfpSKrz3dkELRx7Ew95MM1CWxiZ2S21CSca50JTV
	x7a9CEyCjMJfs5hxFgJ9H+MXTOmyB+ig4dcfbTGkldNyRg4zPFNNH3JdStx8WxVj8ZGRiU1dYFbHA
	GbhLdVCfaUZt6T6jpYKcnmjntXOgtrRW4blOQXRCdUNdR0eCaqReXBwlaBcpJqr/KQZ3z+tgNi+Tf
	nLvwhL0w==;
Received: from localhost ([::1]:24062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irUrs-003Scu-H7; Tue, 14 Jan 2020 22:41:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irUrm-003Scn-1o
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 22:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZyJs6z4kB6gFjsJeULQsisaC2gCoSUdiQkbIPcASPY4=; b=NRdbaXu8NPlcvLXF9SfzJF8AA2
 9xBf1M3/Jdxlcx9ZaVo0axcImrvw/CWIJSM52zSZdQyJ/tStlSFDAOaCfA1bdQq44S6+/f3zTiQQ8
 If1ReiKpk//xfjLmvMi+/ZqZEhUetJqKh6+vib+pa/BseG9+JLq0HHW9VePEq+yuycBt4XaiawJ+u
 SPiOHjrUpW+LysczBw2LKiElf/7s1fduFEbcbqJ5+74VRRAuljimYaED982KebUGl7ISE34+V5yxi
 9jENpcXBbXHsfIi/SxX0pzDSre0KeTMGmYfDpnElKSdz8lGEbgY6LpNwUfZRa5g6PrQ0yU1ahuC5L
 aLOUDl/b0w1GDwUxOFNei7pj6QFl43WDdd9yES0nChJtHO1s/MRsqLRRsqbd5rOB1owUiXIyg7JlA
 LW3eAoUNSB3bc82pzXfsPKGLP5ZkbsEaBsNw6Vffq/HSN2Koy02oO5cU2SGMIeZYxret0906GFVZw
 PXMAgH0nazymX+LL4wAgp693;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irUrl-0007KW-65; Tue, 14 Jan 2020 22:40:53 +0000
Date: Tue, 14 Jan 2020 14:40:50 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Re: Port knock of 445 prevents smbd from starting
Message-ID: <20200114224050.GA28030@jra4>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
 <20200114215623.GE217935@jra4>
 <cb951458c2004bf7a39ab19f0f49916b@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb951458c2004bf7a39ab19f0f49916b@ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 14, 2020 at 10:13:28PM +0000, Christopher O Cowan - Christopher.O.Cowan@ibm.com wrote:
> Sorry, that's my commit of Amitay's patch.
> 
> Here's the compile I did:
> So it should say de768710e16

Yeah, I think you need to add more debugs to find out the
exact length being returned by read_smb_length_return_keepalive()
and what timeout is being used in receive_smb_raw_talloc_partial_read()
or read_packet_remainder() to debug this properly.

