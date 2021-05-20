Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799238A115
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 11:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6/0BDsHd93uDgvXXGL3BS0/x2eTafZNXSBohnk1xGv4=; b=uvfLN6MUmHzrVefuM9TlKDNJQA
	tk3+JhpN0rxAFQFZJusHeK0iOL3jGTOStJ/Uo5QX4ep6vGvZCAndQt0GeogSQ3GPlOIFx0P0lQDrs
	EZRqZxsqS8FzNbsVUadqqTmAdRTHh/4ghYydpF104kPzl7rq5OsjzOW+wwqte+1Lf5NJPRLW5l0dl
	RniER5m6WSDKqAmGUBUTEYVa77rwI3T1zBbsQJz1U18r5bUxNfkg2U1Qb4uCvCVzOW6nJB98lsLte
	wOavRjsByJiZ4FaVawfSJ8Rv8Aa5xiqdkf6PTF2He/UwaXnHb+RwL3zVPcg1JPpPtsZD5mn+Q3QKk
	+AyaQyMA==;
Received: from ip6-localhost ([::1]:57334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljex4-0021ND-Lg; Thu, 20 May 2021 09:26:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57270) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljewz-0021N4-1M
 for samba-technical@lists.samba.org; Thu, 20 May 2021 09:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=6/0BDsHd93uDgvXXGL3BS0/x2eTafZNXSBohnk1xGv4=; b=qwZ/ob4G3ziPtgkn6PXY3X95tR
 Ofk83DpQ6cKYXR2CGY1rXJCNrJfKsK+VgrEGGiDleZJlM4p9Q+QY1Eq/14Y3owm2NqZKsDHhLkXLV
 mdFmrmTwimomscBCdbiB7MsQtSCA5Yxec6jmqeGi0aEMs+PpQUepSsd4QvJYmT8m/wCNUhaMv4tLA
 r3YnZTqnJHzfI4OY5glp0eF+BIe1mlBuXK8cQhE87N7KhABm5KcHANHrdFLuumBKWiDir2EwLa5zK
 2YpUPqjY2eR0gcIZdXkchG4cVcIV6IxKF5FlCWKpkNGZoZcoGM1b6lvqcY331GK0aWp00ICrx9Ka6
 c14WDk2Ciit7JkcjKVrb7tbVOf2mF2+vbLIah6b6ihKRG+VFDQxgws46mw498XGJrgzH/t4076mp+
 gN6fDt1RASTDGPAsKJfwnWJOVw5gphsBFwqEIR6lRnU+n4I3ZsMaSJ6p0o9QudtrvVDhAm4fT5hUL
 B+C1mkFJtRFsVrEAhy6Bw87S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljewy-00015Q-6D
 for samba-technical@lists.samba.org; Thu, 20 May 2021 09:26:40 +0000
To: samba-technical@lists.samba.org
Subject: #samba-technical:matrix.org
Date: Thu, 20 May 2021 11:26:39 +0200
Message-ID: <1743932.cGlQenkl61@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

because of

https://boingboing.net/2021/05/19/freenode-irc-staff-quit-after-new-owner-seizes-control.html

I've created #samba-technical:matrix.org as several Samba Team members already 
use matrix!

Link: https://matrix.to/#/!SyczwOXNZYFHgFpCaR:matrix.org?via=matrix.org


Cheers


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



