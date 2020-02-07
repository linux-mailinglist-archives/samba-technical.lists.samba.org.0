Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B9155C3A
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 17:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=G+vBBT0pC0NYG0tNwoZsDaUYiD9HtaBrJGOizng6ZDo=; b=eLTpdBfE+uZPzl45x/vhD9OGqa
	b7MK/qEBFguR3yXRTsJCTaTG4uZP3t363Btnn8eI6Dohi17g3QA9Q0lSfEC5opCGPEwPCc2q/cRsn
	BWXNueZiVLK1asOezwjmT/BaywipmexDBIM7UV4fsuDuEGZwagJ65tm3ezZ3brwr4RQ/oUEBLJFV0
	ZiQUswqVCCN9GsRu8Xw9mD0zpj78z7HgcSJILabxLXiAShd1AnGDNr8XoIGT/qPQncC460RsXNMhU
	Q2xcDeBm4LpisUfvpeAXeKQXwBDaVGJBRsmRWspLrmUYjwfpJ3ZWmbL7/DeRbVYqPvzc4n40NOr3Y
	9e77FfxQ==;
Received: from localhost ([::1]:30476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j06wB-008jb2-Hi; Fri, 07 Feb 2020 16:57:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j06w3-008jav-Hj
 for samba-technical@lists.samba.org; Fri, 07 Feb 2020 16:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=G+vBBT0pC0NYG0tNwoZsDaUYiD9HtaBrJGOizng6ZDo=; b=yYqpY2PXlqrCJ3xiX3qHUMmNFz
 ZJ8p4/bAe/WZCvchUY8mvgH38bZA364okElMxG0VGW5j3d8/xQynNkBdzOQwZN2Wf2eHQmB4AJvGb
 HSOGmytYNjeDg3jE+QgafaHOabMxeZn0TEMZkeeEqlRZezq5Lr1ak6spJrtedbgzNG5HJdqvN4dBh
 jPVKyNkKXF7fsYSBIQ1XTDSDiJ+LocVrBiaySEf3bfQIMis2vnW9Hw1+uUrK4efmX0GN36mNPQDAC
 HCovndeHnYA8GKYD0GrakE9qkiqUYhkgOZ3Mv8cLNyI24dyqc8msq0JcQqsM1CCFPAletfmJ00Hym
 yEC+YKrxTchL2Eqw2IfMNLRGDt/2CaV0Kvp/xAeK8Q0xsUgHoG/NuuM1ODaLgTHtB5/J9tT4Nbfnv
 Lzn+4QEpr4ZBN71GdXMoNQ/WmLBRTm1lme/5STD//3ZdUDltdjFJmYDTHU3YC354gepegaXTNf4RT
 GuYqGjPRva2kjJzGj5Tgt/qG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j06w2-0002rQ-I6; Fri, 07 Feb 2020 16:56:54 +0000
Date: Fri, 7 Feb 2020 08:56:52 -0800
To: Andreas Schneider <asn@samba.org>
Subject: Re: Video of my FOSDEM Samba talk.
Message-ID: <20200207165652.GB8730@jra4>
References: <20200206165543.GA214397@jra4>
 <1629429.vCTcVmRLes@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1629429.vCTcVmRLes@magrathea>
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
Cc: gd@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 07, 2020 at 08:17:08AM +0100, Andreas Schneider wrote:
> On Thursday, 6 February 2020 17:55:43 CET Jeremy Allison via samba-technical 
> wrote:
> > For people who couldn't be there who might
> > be interested !
> > 
> > https://ftp.osuosl.org/pub/fosdem/2020/H.1308/whats_new_in_samba.webm
> > https://video.fosdem.org/2020/H.1308/whats_new_in_samba.mp4
> 
> Günther, he called our (MS-PAR) work legacy! I think we should assign some 
> printing bugs to Jeremy ... :-)

Err. Sorry. Didn't mean it :-). Please don't punish me so.... :-).

