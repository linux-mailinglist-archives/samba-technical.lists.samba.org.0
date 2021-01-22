Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 379CC2FFF83
	for <lists+samba-technical@lfdr.de>; Fri, 22 Jan 2021 10:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=kbKls9LGJDRovA6R4V1P3vdjaH5KOP0v6JrbWZNoy4g=; b=cXclmKYuYV1xaWTunISyzmyHkb
	JvYUE2OWU+7MphwyMZZBfzXsQ9s/QCU/aCp60Nv3xt4y8zN0jU4rW5SxnWVE8zWtg+IQgxziIIXUf
	OVyENyltDb1F1lNYwAqp+6/P14gGZQ9ryul9j5a3ZfbZBldq+V854N66O5G+r1NwHHHN5Edx2NJFV
	JZqzCp+65etMd1pX0HV+NG8fBa6Kuovet3GioYtSSHKK6UsL++qf9Cugg3jRwbAowRro6rY1zovvg
	EQRlubbsg4YB0Ty7XlZcPk0kFWHYnNO5LRnPW7sW6A8M/xbR6hzNePUBvXOf9jDgYgkFB2V1QfkNQ
	U/7JkSmA==;
Received: from ip6-localhost ([::1]:63942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l2t5K-006dMC-Kr; Fri, 22 Jan 2021 09:50:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39884) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2t51-006dM5-IY
 for samba-technical@lists.samba.org; Fri, 22 Jan 2021 09:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=kbKls9LGJDRovA6R4V1P3vdjaH5KOP0v6JrbWZNoy4g=; b=4BwxkwDf2bLFupp52HvNmpGbXO
 BJ06E+24nW/FfxRAqS69Tyh2M2Qr5oCbJVBVPDdH7hbjQKZyIox3NS9LFhjGdj6lYQ0nGQRtf+prL
 0BG0NwCZCGGC6iEDKvmC71HM7A1BphlMqqUUAmNAwd4sa6IMOaMWDU/FA9qAWnMALkJU286brh7DG
 cwiHVKCiFO7JHuKXSe93abn+HcNSenzc7t2yhUzI7aRe7NyGZT6yncBqzdIVn0bNtOi9ahqSnJn9I
 0F/UcR6zg90U87xfws1TikGWttP/QZi3v1ZYqnQywR0KrbUchjIqyJjDbIu3Z5yISXO/716UJ43nM
 X2Yoc71vIz6m/+ILwqbKCTvuoKjANzNScCdRInsn9UXtmknvimhxajVVnKJOFckGK35PlT++UbWlN
 lf0b8929Xgdu+l5C51N03a9Htibndf3HY5z4uN7NLhZUtJCa91K2++m1MBI9KUTNOo3zOQXYqKAgw
 npwndvq/fx39vI3reQpB1/QS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2t4u-0000R0-LT
 for samba-technical@lists.samba.org; Fri, 22 Jan 2021 09:50:04 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Samba 4.14.0rc2
Organization: Samba Team
Message-ID: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
Date: Fri, 22 Jan 2021 10:50:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
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

Samba 4.14.0rc2 is scheduled for Thursday, February 18 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

