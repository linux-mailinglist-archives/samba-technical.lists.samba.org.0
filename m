Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015A10A1E4
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 17:20:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9etl9hz+skFZgA99rsfrtHdKE2RU7lkhXPQVwdgNgY8=; b=lK3QabMR3B8+w94b+do06OOJk5
	jCrb+owf99BjmZW6oZWmRnFYQINDDaQ/SQU50H3RNEumafWgnrQLy4oXOve2aJp4yMiSQtpsYYZPP
	MDWUIA/AX6yyWseXBlsas0qW/SLyxo5JLs2nwYEwwEdqBOgImVHJAi9a06q4SXqZFNBbVJlZXit6K
	Zy1jG3GFEUDgrlvZKQQfP4RcUyleH2HQ40b8YAmR3AiH3AIEkVuYVNYTaBMdc7dXabS9xfKik9o81
	5gutG4Qamcbto0OMY1AHRwNABnfT/rpnw6dLIeFTTHMQeMPGIMDbIWC50fFXm7gaTL9qgCXRTd2sT
	JGdWQZdw==;
Received: from localhost ([::1]:54838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZda4-002Sog-I7; Tue, 26 Nov 2019 16:20:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZda0-002SoA-9T
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 16:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=9etl9hz+skFZgA99rsfrtHdKE2RU7lkhXPQVwdgNgY8=; b=ByleW4b6V92cBqq/QzkeUkTvQc
 QwM/QgWhuEu/4/zuOi/jYUieonIElgFC/aRf9tf/ewvqLSqQaK4T7XzZf7PQwcOdFMH8oPyPiZ/Uv
 ySgDgMcZxaTW/RkyRUJL9kHxYaNKpYompnD+b/qa5J39x57pO3d4szwxYbIDxCD1p6ucoD0s+48EX
 i38MmY01u0hvLD+jimV16s3hRpo/0ET/Z1kThXj6hNMGpaBBDDfkdXDV7I9zSmSWy6xS6rkzmiM7O
 pB2njNOsN0eDB9sNRoCv/9atB6TNURjqaoSZCaRe2/9kumjWHtGfSnsFqlUXNv+cyxErSve7C20N/
 o95FdEmJMsaIcq8DJR+XgoUoDtG7O5Gw8Mkn1drec/WcvnYWRdPIgsXhRTX7nmOPy+OkpKfvp2Zkd
 Vrsd69j1gbAL7kuUQZbo2Go3ErBRq0Ry6uh2TQHx8Et9IMWktkVF2Kmc79SrHflFBpb4PxS6NS1dU
 ZxaHcx+4fJETPJqd3LpYLlqT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZdZz-0007ss-Rr; Tue, 26 Nov 2019 16:20:43 +0000
To: samba-technical@lists.samba.org,
 Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Tue, 26 Nov 2019 17:20:43 +0100
Message-ID: <1925046.vXGPc2B9mm@magrathea>
In-Reply-To: <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
 <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
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

On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via samba- 
> I have tested those 4 patches (2 yours, Andreas, and 2 mine that I sent
> here previously). Behaviour of /usr/lib/cups/backend/smb symlinked to
> patched smbspool_krb5_wrapper seems to be correct: it passes printing
> tasks from printers without "AuthInfoRequired negotiate" directly to
> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
> "AuthInfoRequired negotiate", where UID is a local ID of a domain user.
> I clearly see this in /var/log/cups/error_log when it is "LogLevel
> debug2" in /etc/cups/cupsd.conf.
> 
> So, these patches are ready to be merged, I think.


I'm not able to apply your patches. Could you please send patches created with 
'git format-patch' or point me to a git repo where I could pick them?


Thanks!

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



