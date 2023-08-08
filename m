Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1719477389B
	for <lists+samba-technical@lfdr.de>; Tue,  8 Aug 2023 09:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=rkZPyATFTOSb0YX4V/p5BH8pssZXCpgfviQgOFH9Kjg=; b=iZ5c0QFXrTAeyNqHS5buj184TG
	cVLcMSXUHLqj9znP/1QsguVsdRb5+td8dx0zfDafYk1cXMa2tjXP6vfeMWPJDSPRZyd4KnyVtVWD7
	U6XpaFSiPlRkB0KrBAagzryDZRSH7abuy4g0gFTnjs7u6m/QPNxduyzakrZ7CusibK4z5rjKw+ZVy
	C5eyqzgRuWUW0/qmb4KhCQqOXZ3VnX/r+7rfiOhY4QyXwp+dextT497q85S4XUjIr9EOSYYwSKgru
	nbwolXb+FLQGWjZA06oEQyDn0aJdbOnAnMXGleZP5E0QRxQsuldye/AZ0GNz0ZjSzkDQpB8F4kYSm
	iG9PyS4g==;
Received: from ip6-localhost ([::1]:60648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTHCS-00Ae0P-C4; Tue, 08 Aug 2023 07:32:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTHCB-00Adst-JR
 for samba-technical@lists.samba.org; Tue, 08 Aug 2023 07:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=rkZPyATFTOSb0YX4V/p5BH8pssZXCpgfviQgOFH9Kjg=; b=pwTCiSgAHpOwvFLtEpsuCk5SOb
 GE0X54+R8I28fb7kNEIyt5YA7M3kgaBoX8DvI/9P2p8dCOV0Ne0reg4Q/y56Z6D2puBp9qXQ6suKD
 KAPqKsME5kAb+I7B9w7ii6LyYXvdLFP5G2s6QPoUZgdiiSqEJsxCSkIIpFty0Maw/aJWMPT3zzwlV
 SsQWqtYmo6VFjNWznqxjoGwDzqPEu9EaDCX/DSO8q/f3lf05HnZYMzfL3LcybKpzmONPVQ49ib/Al
 lM0jsFBFWjDaExDMeQbTZbrNa2hRJHSz5JapbQ8yl9JtBcdft9lptF8XEeOnwdlLTmHvQOKeBaztp
 lCS0Pyjxs+YcpTKfTj2dRqbD3megb2Cl7WBha39el/HC0oOz3U277iIM/DBxPKRAlirznizf/7TqT
 GcppJLXDlHsntKckXATHQqaR7YGVqRDOCJIypFYXNA0Ds4RhD1TOhuw1JsF4aivtnfMSFkBJJydth
 oXBV+mkGp/Tq8/GIWusm+6CI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qTHCA-006lL1-0Q for samba-technical@lists.samba.org;
 Tue, 08 Aug 2023 07:31:58 +0000
Message-ID: <0e7ca3b0-58d3-26c0-c8fe-0a8d06c4cafa@samba.org>
Date: Tue, 8 Aug 2023 09:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.0rc3
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

Samba 4.19.0rc3 is scheduled for Friday, August 18 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


