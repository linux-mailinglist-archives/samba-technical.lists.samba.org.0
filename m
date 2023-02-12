Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE916935AF
	for <lists+samba-technical@lfdr.de>; Sun, 12 Feb 2023 03:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=13n7orFtfB4ykJMQSCkI+SVHhcT583fh+bxIuvlC7mY=; b=iQQOuS+T5n+xXreM5z0cAblolM
	/ZvrHO2ZY8dTKX6TM8iDCPMzQF14hHDKu4vZawyVHJH3CvpNbWA3rMIUSrO9GCSgKR1InX+t7vk6K
	NWO7KcbqSJOhvnvnbmDst+K0bkQ2iZNZEIOIXHOBoOzBbzU+Kc3fL/k7gKm9o9K9fOjswcC6z6oQb
	drJSu70Kj8rKebhaCeCzCN6Qokj/HnogaNpjCwV7cYBzZcnMLT2IdUjqVfnGfuQmRw4DkyeFB3vqs
	wB+bpRg07GGqtVGv3zu8Hk/frfDoZWoxpbY2bQjlU9rCCWa1+4DsDSLxFNNr6FNRB2coQrO5j0aAQ
	p75Whl9w==;
Received: from ip6-localhost ([::1]:33200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pR2No-00BYz5-Kv; Sun, 12 Feb 2023 02:46:28 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36383) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pR2Nf-00BYyw-MX
 for samba-technical@lists.samba.org; Sun, 12 Feb 2023 02:46:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso13864269pjj.1
 for <samba-technical@lists.samba.org>; Sat, 11 Feb 2023 18:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=13n7orFtfB4ykJMQSCkI+SVHhcT583fh+bxIuvlC7mY=;
 b=ESXg7vS2YfHpVFr9OQZAHv9M3hthBxU2Row9ea0aJR9IjQ6GL15VCoTe39SuK/apcz
 lfGM7PXnvgu0PiiAykezRpIW1FRoeZgXJJ1f5yT+0kseS0KVDaqQDpA+I+Dymcgg1zY1
 iJGmRqnL0dCDPWM41X5z2Oh7WP3Z/XxGAGv3Avnn9/JwRFp3kolnB1oZQv8VGQXmwX3d
 rD5u2DHcmPTZ0/x3/2kVydfAybYsxNmLWQeSV3+yI7B70FNGMxThFxKX2Pd0AYuzKaP5
 7cdqi426YYBSMwwbt6a0/WgGTHOQHmA3ZJ65WGdgZGheeKN3uSzavEMms8FWcLknPqQx
 PyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13n7orFtfB4ykJMQSCkI+SVHhcT583fh+bxIuvlC7mY=;
 b=Ovyq8O6cBA9Ufnv1fnHr2p5mPwANzYBO35Dh415SvVSqBUawR+mBiIEDVoEgiBtNud
 N4Fx23UvlPsW24Fqsx+sjv/ebZ3AjIgHCc1WK/CF35UOQAV5IelwRTvOjebBn9UIElLY
 mqJCXTQWIjaHviJBMCeqI+7bcgSB548wudS1jFsxAVcpNaS5rDi1/2O7HhKAp24WbIev
 CJWcRzF03WmSGLzyJRjeOBOtcao7GnQyk2lcqfj7uWNlqlwA2PTTkJ5FMdUgNwVGRdET
 KPnS1uzu0uaxofOyVrmUw4Qk2H3gNrKWdz7j/1g5Ox/om/xVd0SxPc/CbOR4YDOikElC
 mpgw==
X-Gm-Message-State: AO0yUKUwt71Dddbc8x/Ur3RLS6GDmnZhKBahrHAAKRJ2mJ+hShRFQVdo
 EjCRx+VVTJ1u2B9HGLxZiI3rKA==
X-Google-Smtp-Source: AK7set8Q/Jh+L5ryxfXOAajWPMV5niu5B7Z5pm8YR78FRqb1qNpO8JtR/DWeRFI2ODz7Fg0mdVhiIg==
X-Received: by 2002:a17:902:f685:b0:199:2ee:6248 with SMTP id
 l5-20020a170902f68500b0019902ee6248mr21267626plg.0.1676169976461; 
 Sat, 11 Feb 2023 18:46:16 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a63be4d000000b00478ca052819sm4935737pgo.47.2023.02.11.18.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 18:46:15 -0800 (PST)
Message-ID: <467c0abe-251f-d74b-57c8-91e02bec1c05@kernel.dk>
Date: Sat, 11 Feb 2023 19:46:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
 <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
 <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
 <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
 <Y+cJDnnMuirSjO3E@T590> <55eaac9e-0d77-1fa2-df27-4d64e123177e@kernel.dk>
 <Y+euv+zR5ltTELqk@T590> <787c3b62-f5d8-694d-cd2f-24b40848e39f@kernel.dk>
 <CAHk-=whQ_V1ZE6jhQKHDk1MKvEkjpF2Pj-OcRQRXBTMsNpA1YA@mail.gmail.com>
In-Reply-To: <CAHk-=whQ_V1ZE6jhQKHDk1MKvEkjpF2Pj-OcRQRXBTMsNpA1YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
From: Jens Axboe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jens Axboe <axboe@kernel.dk>
Cc: Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/11/23 11:57 AM, Linus Torvalds wrote:
> On Sat, Feb 11, 2023 at 7:33 AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> OK, but then the ignore_sig change should not be needed at all, just
>> changing that first bit to fatal_signal_pending() would do the trick?
> 
> Right. That was my point. The 'ignore_sig' flag just doesn't make
> sense. It was a hack for a case that shouldn't exist.

Yep, just wanted to confirm that we'd _only_ do that first one and
not go to sleep later on ignoring a signal as that could lead to
issues. Your fatal signal pending suggestion is all we need.

-- 
Jens Axboe



