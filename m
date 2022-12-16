Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0164E859
	for <lists+samba-technical@lfdr.de>; Fri, 16 Dec 2022 09:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=W7+H6wxzQNhdRHYGRuGvq3l6SqXtwXlaJew3gTljPLE=; b=6NwDaTuy1D24hPGplz4wsh2L79
	hyP3jH4XeJeKBnxapzF5iKpeEI/W3fRxwQK2HsGEPoqrK2VHReiT9GaTwcewKoiPxjb58T1mvoIUD
	jvuv7DE6AN+OOBhBd2altvFNxEBnV0UsloBS3J5aZ1BwL7iomgk5JhdyhNBXRzTjT5CyBWdXBagI5
	fSYG1azJUEH1mh9+bRYDvbfd/8ohYEqlJVReEMH0wBYvmL9m7qXBZ7zjR1vhrLTpdMOpldtf0NjEO
	SEmg/ZwEbsXFZ9ggXmI0b1cZ2mgVqaY9QH1Im72p6wzbrpjAQP03wMqnxvX97FrAKhOamDTBsm3JD
	sqXxCzaA==;
Received: from ip6-localhost ([::1]:62496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p66VX-009ied-63; Fri, 16 Dec 2022 08:55:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29714) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p66VS-009id0-EH
 for samba-technical@lists.samba.org; Fri, 16 Dec 2022 08:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=W7+H6wxzQNhdRHYGRuGvq3l6SqXtwXlaJew3gTljPLE=; b=z6zpt9LTI9eJajTDKcbPO1lSe1
 SHO20VRYNZ6JJM8Q19/sk7WIno9pr9PxMaHzfn2F23bj7U1CFEAX7WYImmOSnq8z/vdToPNEAuJ26
 lVye8+1NZ57mJpbGwdjpwMTkqMGy9SePrXYniu+/1ZDuORxRTCLVyCaK5s+rCFz/YcXa+7BH91LxZ
 sFAHg5ZLg6wnp65rpEHNVnLdc08w4JL84z/ItbEI68jJpSPnljYNWGYhT+8nwV2oAwOjKzyrammTg
 4/b5PS3M46//uc+66n4PujPHlQn21wHuo5IRKzcf/oMkYZTnoudxRL1C73kY8GjyZswUbnHiaVhZE
 zNg+jgMRlgxiL8TphQQxolITT4osIo4hrFq+STo/MZzXorhzhMeJNaqIQAkt22XqfCGTHk07833gX
 H0Ql/vaG+fW2iPXNSbB120yr+q41C19iMpYdvPg63+/W+LK+fG7oHoLL+UpSi284DVXVRftb9P60V
 QyoTN98celI8Q33SuFWIhY/z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p66VR-004B4Y-Rh
 for samba-technical@lists.samba.org; Fri, 16 Dec 2022 08:55:49 +0000
Message-ID: <38bf0a43-b9c4-b7de-436d-1ee1265113a1@samba.org>
Date: Fri, 16 Dec 2022 09:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17 and 4.16] Samba 4.17.5 and 4.16.9
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

Samba 4.17.5 is scheduled for Thursday, January 26 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Samba 4.16.9 is scheduled for Thursday, February 16 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


