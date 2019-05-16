Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB705201CC
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 10:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lqIV7lyvvJ1BcoVpo2EpQt1USCqXq5+9FsESN3vx7Uo=; b=IBW7RpT7s4ihd0CMTAjZPy6ovp
	A6+7jvHAS89Km/2OcFIb6mqZdJDIZyPDD6OSmyW9+rG1Or2qR8hXSeAOvYDMKYledf7Fqd9Z4Geio
	P6rue2LpIIf9mOQBW/skmZawf59soKjsOZBEZhqBkgvgN1wnZxCtlekWZnuGiZRmSbJ42+FLK8G36
	eZ1ML5/4u3TLPUP8B7Vd/58uZLXTezQ8jqvEnw1/cMRE6oXqbOuHFS2EsA/yPfGvz+XRaKwpR2f/h
	HKPEJHKN/n1uR65Q227Tq0FL0405MJ3V2/9tGZHFgIhE78SQfNoSI0kF+2s0SCYWe+1lra06ZeYp4
	uwjwnO8w==;
Received: from localhost ([::1]:43912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRCDZ-0001lB-OH; Thu, 16 May 2019 08:58:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:23928) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRCDV-0001l4-JL
 for samba-technical@lists.samba.org; Thu, 16 May 2019 08:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=lqIV7lyvvJ1BcoVpo2EpQt1USCqXq5+9FsESN3vx7Uo=; b=jFs7xbWrxPdyA1T1sYFuOZFdrn
 apaoDbuMbcADSVG33tdlDpd+oih5sjx1keud//5JJuY0vvmW3BtJJj97QIZgIa3ikzK3XlIZ6WGTB
 M/Ee/qTLyawNLVZ4G3p7MMjLubJbCaBPtlj2Nc/UIbvF5YJoFGBpr5StJ/J22lOEhxrQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hRCDV-0001Cw-4s; Thu, 16 May 2019 08:58:21 +0000
To: samba-technical@lists.samba.org, Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] lib:util: Fix tfork return value if sigprocmask fails
Date: Thu, 16 May 2019 10:58:20 +0200
Message-ID: <6501675.kvF2Nx3br8@magrathea.fritz.box>
In-Reply-To: <20190516055628.7ta65ravwnolyfjx@inti>
References: <CADRDgG5Oh2GfCzrzZzHDhD6nzCqCLgctptdK7-stYqjwsOp96g@mail.gmail.com>
 <20190516055628.7ta65ravwnolyfjx@inti>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, May 16, 2019 7:56:29 AM CEST Ralph Boehme via samba-technical 
wrote:
> On Sat, May 11, 2019 at 09:31:44PM +0200, Rikard Falkeborn via samba-
technical wrote:
> >Returning a non-zero value from a function with bool as return value is
> >the same as returning true. Change the return value to false if
> >sigprocmask or pthread_sigmask fails to indicate failure.
> 
> thanks Rikard!
> 
> Patch is obiously correct. Second team reviewer please?

RB+ and pushed to autobuild! Thanks!


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



