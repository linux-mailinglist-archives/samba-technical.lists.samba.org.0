Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367C26A6A7
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 15:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xBX00HCjbsfI9COglWkAgf+/0sRFDVObQ/ZI0PSs7e8=; b=AjUnYixxevBP4Ux6o0E1rjBVVs
	GSfYxAY/jefnJyp/e6k+8M+LEnCy5Jm+EDpglAb7OnWg3xj+bzuLQJgwqNStg5a5HJrFze+7mN2nC
	Xo9RYkoQWhv5Q2XNpByCRUwBcvLf/RiWGUiWHMqOd4A0w3uupfplJy9pVYqqcHQ0wrxY+SyvGVD6P
	xfQPOT63WYqi+iNlCo01GpJFXCziDw0JcMkE4JqPkKyFTZ5yY5+DoVd8tsLSc+yiXD5unKxvrEP2G
	jv9228YRo9dYxbuXvAK2t2XBv5+OPpmk/BMdn1muRKoYrzckyufbNLcD2UwwHi8QMphsk2kzV/jSy
	jA6OBExA==;
Received: from localhost ([::1]:27744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIBU3-005VKH-76; Tue, 15 Sep 2020 13:58:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIBTx-005VJE-Uo
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 13:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xBX00HCjbsfI9COglWkAgf+/0sRFDVObQ/ZI0PSs7e8=; b=dkBPIZWTYfHs9XMNLCF8ivyv1Z
 ZQRfkInaGDOtMY/ooPvZawAxgkpZESCKpOQPOMY/xQwaWoBQhtm/+PQXmSlO8eQp5JMhL+ABvNNop
 VH9oi//fpAeQPkUlcy67S5Kvk/or+3tDmCFtwOGSa1nEnKF8vSvtK/dFT1u8HURKUQNu/1O7KvbSa
 4GRS1V0nAmBmZr9P0bNWlXfyJPrOuZ/mwmV9qWK93vzAvAt0K5PSR4Kb9xfw3+wPxPiUwYIhH1sGL
 WpIJaZYvw3Zn8h/8wUJIr7MS37inGdVEv+TCkYSBcMHEHg5eOPyk1PXP8vavL5g0Z1/gvK9rp+AbO
 p+UZMh+LFunLPOzS5HpreLaBEftd0JgirjiXUgGj6f7PfJmRSmeWv/OehYnp+HIwR6RO4j6LOY7pX
 IE1A9yXtd8//pbSgyrg38eauZE/0vCov9C4Ag2g0NHKk/yD2q9GwSqs/R6Bqq0Q7MqLJ6Vtbt9yFy
 dBCa4611wBJ1tLkH+sDTNj/A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIBTx-0000zu-MS
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 13:58:53 +0000
Subject: Re: [Release Planning 4.13] Samba 4.13.0
To: samba-technical@lists.samba.org
References: <cad587a0-04ae-e979-e80f-c51d81386762@samba.org>
Organization: Samba Team
Message-ID: <7022819b-4f73-0f67-cd7b-452999113ee6@samba.org>
Date: Tue, 15 Sep 2020 15:58:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cad587a0-04ae-e979-e80f-c51d81386762@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 07.09.20 um 13:05 schrieb Karolin Seeger via samba-technical:
> Samba 4.13.0 is scheduled for Tuesday, September 15 2020.
> If there are any objections, please let me know asap.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
> has been updated accordingly.

unfortunately, we had to ship another release candidate today.

Samba 4.13.0 is scheduled for Tuesday, September 22.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

