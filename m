Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 996FDC8F5E1
	for <lists+samba-technical@lfdr.de>; Thu, 27 Nov 2025 16:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MwSAMeojLPnHQYAWzfGJ71lWIIucI3gfYfC0Awk0ei4=; b=ZT+glNecyOjs5BjtizPnYl6VKF
	OH42Z5z09p+dHQBmMdQRmC0YSL+0h+cAiTu9/uEyKLkqw3jW/qu3wpvqEzcrfoDHXFdUOFZAXosn3
	oWKT7a9ONkcbof8LidD7IZgP9X5AsiI+/jxC82sQtgNTxtqgZNrq8f+g7VOicTV00TMPvT6xeP5pj
	7v+KG/beLB4MP6Ac19+yNZRWwhaN5pd+0+YNwqLXArzE4/WJzj8HObSAyUBzQT8qF/HToU85DoTy8
	q9zGr9j+qorDiYNcwZyzjOOuTVck/oUvjgjU1i8HRVj4YFGWsaanSeaYmFRdvfNmJyJN+B2xSBHHV
	k9OzCLkw==;
Received: from ip6-localhost ([::1]:41248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOeKN-00DSb1-E3; Thu, 27 Nov 2025 15:54:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57494) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOeKJ-00DSau-3B
 for samba-technical@lists.samba.org; Thu, 27 Nov 2025 15:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MwSAMeojLPnHQYAWzfGJ71lWIIucI3gfYfC0Awk0ei4=; b=iRlWwmb28BlmUPOI4ErnS20d8I
 MtFoMnKM9uFhhnYDRQzCxylDpeAxB+BPT3VgZYHRUwkrVIgUrhMtOZw3cZbmZdvwDT1ggKhu+tYDD
 553QREIxaw0hk2JQvJF0Ja0jJU5uCrxfQejY5BwC144QIga6QTFhKdCTS5fj+LZjv0EuY1yCrqTkZ
 Yz/69yFLslx/96l/+VcJaGYu3P6v5L6I4/CWXdqcSeq5+F4kd48A2tl86faLCt7JxONzqBhVDItp3
 LNngWssl5CqM6foHGmw5NjL63B7N6IH5pP/Ci/8EDwrlZJv46V11yHxvMP4DFRYd1ILzM4MVre8c6
 zqg/mG2+bGE70HOsiPQ07wiWsrmB+UpBx1pfMliIWtuQJBIPdoqoWXMvkibljievHra2n5CiIqoNd
 epPzjxDRJ5pJhYtBEI+yQhVbIrgAb8P1xkEW3limGyniG5ZQHQ00o6hfz6sGqL0mdBpaf3PVE+q9F
 t3N/c0ksYwkxbtfzdqtBQ33K;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOeKI-00G1J2-2S; Thu, 27 Nov 2025 15:54:34 +0000
Message-ID: <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
Date: Thu, 27 Nov 2025 16:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Steve French <smfrench@gmail.com>
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 26.11.25 um 02:07 schrieb Namjae Jeon:
> On Wed, Nov 26, 2025 at 8:50 AM Namjae Jeon <linkinjeon@kernel.org> wrote:
>>
>> On Tue, Nov 25, 2025 at 11:22 PM Stefan Metzmacher <metze@samba.org> wrote:
>>>
>>> Hi,
>>>
>>> here are some small cleanups for a problem Nanjae reported,
>>> where two WARN_ON_ONCE(sc->status != ...) checks where triggered
>>> by a Windows 11 client.
>>>
>>> The patches should relax the checks if an error happened before,
>>> they are intended for 6.18 final, as far as I can see the
>>> problem was introduced during the 6.18 cycle only.
>>>
>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
>>> message, I'd really propose to keep this for 6.18, also for the
>>> client where the actual problem may not exists, but if they
>>> exist, it will be useful to have the more useful messages
>>> in 6.16 final.
> Anyway, Applied this patch-set to #ksmbd-for-next-next.
> Please check the below issue.

Steve, can you move this into ksmbd-for-next?

Thanks!
metze


