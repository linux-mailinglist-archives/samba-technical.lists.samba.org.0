Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22693EA4F5
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 21:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=CxoMIq22AXFOD8qI+1XjannvF68Kg+xhNaMbH4X5JjE=; b=Sxh1uVnSVkHFYYtPizePJ0KQAQ
	HJ1Pay37wyJAAYOCVDZeDXK2fMeBQRiz44HrFqD6h1Zo/YSSEs2u8z4r323LAnoDSu/JLgihKn14l
	pPgJi4MXuP0Lb6sUQMJ0Lc9vmnejA4Jt5fK3GwJjM42hSmaEjcBTV4FeEgi52nxzSdfyKsK7HzpL6
	kersfaIZ+AjdiNnrdeAB4C5Iuwuoeq8r+AcsaQucjnN/JStnGsUIXRNntVGiGD4YSTsZrr2TGzCZE
	PBsPFgB55C78eyYWpd3xIr296jF0+kAQzC+v0jGMyxFMuUR1iDBq4SBDWzO5gFYZfSRkp+pW/ZLDe
	9mgn5Brg==;
Received: from localhost ([::1]:43276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPusP-003pIQ-PJ; Wed, 30 Oct 2019 20:47:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37462) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPusL-003pIJ-Jt
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 20:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=CxoMIq22AXFOD8qI+1XjannvF68Kg+xhNaMbH4X5JjE=; b=NRSa2CJc09pLz/jlADrBRnzSWL
 D+Rmh9rOduaX7dV8DkiYF8SIBQgHo9TuJhL9VLftDJhvBDriI7Ewg4NgO6y6ZJedrQoyeWR+/Y/kw
 4rewh5VXZU1zeuL7iKs3/OX1m2U6rA+XktbWaxEdcfBj3PzOz//Yj+Q1z8t2n/+LRMagXNmPnP3mz
 LcF81nfZaNsKY7FcggsMe5wDkI7RKCGkwEdGdK9+d9wrQF4A8cYlfWSfEC0PPiDFdCzDTL/2Ps8gq
 fzgj/LrEmCLEGCP82aE/lBfghKvrN+6xgxbET1zsDxgGxYCvgfulrXuchSRDflzBWvVYJsWesmepB
 /CorhglHvlmV4ShmIVEqt5txaVGfFcpx77bOmBTybTrLVPtn9+C9rVUHvVMEfAAWj4b3FtkJOVvUU
 g3FGR/x7wdYQRvVFnr5jx2TX7VKV3Vz8+W5pCjyGkhnpFWW0E/W+fTX2AAUzqUmtyF9N81MG/72Jz
 GRTwMJS/v5ka4Erzq3sq3VTo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPusL-0005VR-3k; Wed, 30 Oct 2019 20:47:29 +0000
Subject: Re: Samba build error on Fedora 31 can't find 'nsl'
To: Steve French <smfrench@gmail.com>
References: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
Message-ID: <de5b3be6-e8af-a87d-d307-d212a80027d2@samba.org>
Date: Wed, 30 Oct 2019 21:47:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/30/19 5:19 PM, Steve French via samba-technical wrote:
> Doing a clean build of Samba on Fedora 31 (master from jra's branch of
> a few months ago) 

try rebase on current master. Iirc there were a few patches recently in
that area by Andreas (and Alexander iirc).


-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

