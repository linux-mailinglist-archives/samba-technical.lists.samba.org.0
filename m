Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD526231F1
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 18:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9WVvir8FcFqXYuqjU1pPAgzp/eREFYPNJnWAqo3vUZk=; b=V+gYEj2EyQi7bbgozwFmohVrHs
	95dW3TK6EMVImYoTw2PZsGhQqBWnKNBpv8zLQZQT/EDnf3i+IuKsZEoLx14n74fNKIvi1JS1F002i
	alqvCIDuIyUuuUUxJVj7vgUgBVctjBs0W265uZcxgLM9TfrgmHKRXipKvopLVOgDAvq9ofWlZjTLu
	B9fOxvlsU8cJODqhNKyCjZcbVF1mFyU7CNWs2qOcOmYuTKqIEr99IhcqRmI9BRN5N6rjEimmcU0EE
	PLmk8s2zPwtdeJM1KM/uaYC2I33uwR0k+dHXl0iOG36nIk7Sj2YQ2iLiGQ8dGeFuS2TD3m8AwGA+9
	jgHGhIPQ==;
Received: from ip6-localhost ([::1]:58348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ospLH-00Bqtr-Dq; Wed, 09 Nov 2022 17:58:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43972) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ospLB-00Bqtf-7N
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 17:58:24 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso2641375pjc.2
 for <samba-technical@lists.samba.org>; Wed, 09 Nov 2022 09:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LrHVdvEiebVxsfRKB1PFPFBqoTzGdDh2OvTR8G5Ie4w=;
 b=NX4IYVnZCuUj9UEpeXTuFWacTS4k9wNhDiaY79os7U0hVaKrn03xQgs0LjxamqLi12
 0T08xgXJicQk3hTCEvsfogP7afOU0gBXXVevPRj+JnD+xdZMciHQj15tpqHwr1ijE12q
 BU8PJrCe/SE5ANVpJ0TLUdI1OnMN4LSnQEF6rMvV90rS9lX4tnc0facrXM/awjYiOvj6
 84Z3CDiJSTL36Vjc89rryhClWcyhLXvSpxg6/yhSSk0tK4J1JERIhD4jWC85BSYM50LJ
 K1B7pYxdOKI+KB5OvWl4RYXDxWRa9mLd/4i3wPYg9g9RD1HId6LUIYYJB4p/IJacMRby
 wNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LrHVdvEiebVxsfRKB1PFPFBqoTzGdDh2OvTR8G5Ie4w=;
 b=P9HwE8TJ4JGy+L3ovGw4WspMH66l2Ejf+9/IRnXaFg+s0d+8evyWBA4wDX+Pj4L/WU
 7/5dVGaaLgFB4zzAv1Jwl5YL624imeP5GOUEh5CDpnY+t8mJ/vOTn7t8g9G9K3ZHOh9h
 HJC+qCWGux9oS2H5A4RUXLDWjGPYcOVjdmIbu/KcgH+KNMfDEJPRETQSsM+bZyr8VULO
 C9KVYiAVeSbLsf28zn8/o7ViZW7tPQsOnXjhhcwJ/39LRx/AlqkOwldflOUPRXYYNC4z
 gfF8WNmZ73t5xSmbdxCvek1rPQ2nYOxYIQSvyEzeIaLvjWljUZGfC+oYUw7BdEwyxm4C
 k8Kw==
X-Gm-Message-State: ACrzQf0EXeFKWAu6WdQCNp81oV3h4rWZM2tH8aV+vhR86hV+rZp38rQy
 7cwOV1YbwqHfZSldss/OjUSHvYePQCiE3r6GNV23rH7DyCd+zjyX
X-Google-Smtp-Source: AMsMyM6VCFpDrgWThZhUzGP0vV5Bx+bWRIkamV9Jn1AaKKHBFR9YX4m7B4841XScLB2ImwUtsENO+mLYLLwKDyHgfhA=
X-Received: by 2002:a17:902:768c:b0:186:b136:187a with SMTP id
 m12-20020a170902768c00b00186b136187amr60392510pll.94.1668016698054; Wed, 09
 Nov 2022 09:58:18 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 9 Nov 2022 12:58:07 -0500
Message-ID: <CAB5c7xqc7BfQ3dCA=Le9izqxzC=bzAWZpYzE4tFUv1N-_Ocfmw@mail.gmail.com>
Subject: FSCTL_READ_FILE_USN_DATA on "SmartScreen" alternate data stream
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey all,

I just saw an smbd crash where we asserted here:
```
static NTSTATUS vfswrap_fsctl(struct vfs_handle_struct *handle,
                              struct files_struct *fsp,
                              TALLOC_CTX *ctx,
                              uint32_t function,
                              uint16_t req_flags, /* Needed for UNICODE ...
*/
                              const uint8_t *_in_data,
                              uint32_t in_len,
                              uint8_t **_out_data,
                              uint32_t max_out_len,
                              uint32_t *out_len)
{
        const char *in_data = (const char *)_in_data;
        char **out_data = (char **)_out_data;
        NTSTATUS status;

        SMB_ASSERT(!fsp_is_alternate_stream(fsp));
```

Due to what appears to be a client sending FSCTL_READ_FILE_USN_DATA ioctl
to a SmartScreen alternate data stream.

```
#6  0x00000008016d13be in vfswrap_fsctl (handle=0x816c73280,
fsp=0x816c3d260, ctx=0x810398670, function=590059, req_flags=49217,
_in_data=0x0, in_len=0, _out_data=0x7fffffffdfa0, max_out_len=320,
    out_len=0x7fffffffe070)

(gdb) p *fsp.fsp_name
$3 = {base_name = 0x816c3e5c0 "System/Drivers/Peripherals/SoundBlaster
X3/Drivers version 3.4.98.00/USBCMDMasterInstaller_3.4.98.00.exe",
stream_name = 0x816c3e690 ":SmartScreen", flags = 0, st = {
    st_ex_dev = 17440526963365876026, st_ex_ino = 13799128922567319488,
st_ex_gen = 27211941, st_ex_file_id = 33830, st_ex_mode = 33272,
st_ex_nlink = 1, st_ex_uid = 1000, st_ex_gid = 0,
    st_ex_rdev = 18446744073709551615, st_ex_size = 7, st_ex_atime =
{tv_sec = 1667955800, tv_nsec = 250523235}, st_ex_mtime = {tv_sec =
1667955806, tv_nsec = 707597100}, st_ex_ctime = {
      tv_sec = 1667955806, tv_nsec = 707691237}, st_ex_btime = {tv_sec =
1667955801, tv_nsec = 825131076}, st_ex_itime = {tv_sec = 1667955801,
tv_nsec = 825131076}, st_ex_blksize = 131072,
    st_ex_blocks = 1, st_ex_flags = 2048, st_ex_iflags = 6}, twrp = 0, fsp
= 0x816c3d260, fsp_link = 0x810237480}
```

Of course, it's a soundblaster driver file :))) has anyone else seen this
behavior before from client? Perhaps we need to add fsctl hook to
streams_xattr since this I think asserting here is probably a bit excessive
(maybe pass along base fsp in this case)?
