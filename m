Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF54A4D08
	for <lists+samba-technical@lfdr.de>; Mon, 31 Jan 2022 18:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OI+u1fH481hbv/hwub2ozf3raqX2Or/TUcCaB0/qnwo=; b=AUdt6rFVNfyyxZsHBnBK7p8bJm
	vApHdVVzK5tgw0g96G9D3DL2pSqjsLD0mhOaIugPhPurBSL+/ar8srGhwak03MbFQ4mwIkM9ihDPb
	bie81giPA6wDsMkjDNTuaHJL+tepgg1RRtmbkM9VXe/3vnxjDnhEZH+6BPip4nEeoZdlj+F/FIONn
	ZFsbaL+liQTtbzVJt5+S5r+utR0PwpNLtmQw46j4nNCNgovqz8KxbFwp4ZSmW0tSHkEhiKVhb4uSR
	28sPzZfodYXw6nhRhkoCbCNnqRvKfvMaigbT7xL8caCfZcAegxSgyEwmrAdPLEOOJOR40t14rtHyq
	uUJM6+7Q==;
Received: from ip6-localhost ([::1]:34112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEaNA-002pHP-Tx; Mon, 31 Jan 2022 17:21:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEaN3-002pHG-Rz
 for samba-technical@lists.samba.org; Mon, 31 Jan 2022 17:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=OI+u1fH481hbv/hwub2ozf3raqX2Or/TUcCaB0/qnwo=; b=tcA/qM1vV/6PW6ROGIKU2dkExL
 /LFcAPIZEnzRlWMCrZ7F9v0/I6azeg6hV7L2XXpGkKZgFis+j2TN42Ox2LFl2XwysVR1HiNbE0Pjp
 sx0AWLa2doCBkMe6xgUGf587DqXQO2YFoQtSIutj9dx8PoCzAjIN5qH46YcC6omQkMT3AlMB0Ckwl
 V1IhMhWh4OOvSbfmNw2iqTht5mqQvU8yEY60PYVGylxOguU7XGGTX+HrjofOXHGcoaL3WvczPsLHP
 Y12pnDef2lc+4wK1usBRNAYYgXohqXkNlLRNGjY75uFLodbzmPEkacIwfRF7qHoeahLQgOW1h9NB/
 8iqakE3koYfm08FUxcTli1Q18iOskweIr3OXQnNFN2URybGQ5B8Tc4cuzJeG/UzA5bDBZXn3WWuir
 eyobDl7jljGtnq+663LV68+PO2Hp5Ixlt7nSwxew0IhGFl9XNZ7iatrnCs1CE6IOlxsnhrLcMH4dB
 npIbVoJrR4pjrrDYJ1f+JDDY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nEaN3-001YBq-ER
 for samba-technical@lists.samba.org; Mon, 31 Jan 2022 17:21:41 +0000
Message-ID: <dcb1867e-9690-afab-bdeb-fe071bf0af94@samba.org>
Date: Mon, 31 Jan 2022 18:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
Subject: [Release Planning 4.16, 4.15 and 4.14] Samba 4.16.0rc3, 4.15.6 and
 4.14.13
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.16.0rc3 is scheduled for Monday, February 14 2022.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Samba 4.15.6 is scheduled for Monday, March 14 2022.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Samba 4.14.13 is scheduled for Monday, April 4 2022.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


